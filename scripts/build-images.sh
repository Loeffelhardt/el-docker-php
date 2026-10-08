#!/usr/bin/env bash
#
# Build and push loeffelhardt/php Docker images locally, faster than the
# GitHub Actions runner (which relies on slow QEMU emulation).
#
# Matrix of images/tags/platforms lives in images.json (single source of
# truth, kept in sync with .github/workflows/build.yml).
#
# Usage:
#   scripts/build-images.sh build [IMAGE_ID]     # build & warm local cache, no push
#   scripts/build-images.sh push  [IMAGE_ID]     # (re)build from cache & push
#   scripts/build-images.sh login                # prompt for Docker Hub credentials
#   scripts/build-images.sh list                 # list available IMAGE_IDs
#   scripts/build-images.sh clean                # remove builder & local cache
#
# IMAGE_ID is matched as a substring against the "id" field in images.json
# (e.g. "alpine/3.24/8.5", "alpine", "debian"). Omit to target all images.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGES_FILE="${ROOT_DIR}/images.json"
CACHE_DIR="${ROOT_DIR}/.buildx-cache"
BUILDER_NAME="el-docker-php-builder"

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[1;31mERROR:\033[0m %s\n' "$*" >&2; exit 1; }

require_bin() {
  command -v "$1" >/dev/null 2>&1 || die "'$1' is required but not installed."
}

ensure_builder() {
  if ! docker buildx inspect "${BUILDER_NAME}" >/dev/null 2>&1; then
    log "Creating buildx builder '${BUILDER_NAME}'"
    docker buildx create --name "${BUILDER_NAME}" --driver docker-container --bootstrap
  fi
  docker buildx use "${BUILDER_NAME}"
}

docker_login() {
  if [[ -n "${DOCKER_USERNAME:-}" && -n "${DOCKER_PASSWORD:-}" ]]; then
    log "Logging in to Docker Hub as ${DOCKER_USERNAME} (from env)"
    printf '%s' "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin
    return
  fi

  read -r -p "Docker Hub username (loeffelhardt-bot): " docker_user
  read -r -s -p "Docker Hub password/token: " docker_pass
  echo
  [[ -n "${docker_user}" ]] || die "Username cannot be empty."
  [[ -n "${docker_pass}" ]] || die "Password/token cannot be empty."
  printf '%s' "${docker_pass}" | docker login --username "${docker_user}" --password-stdin
}

# Print matrix entries matching optional filter, one JSON object per line.
matrix_entries() {
  local filter="${1:-}"
  if [[ -z "${filter}" ]]; then
    jq -c '.[]' "${IMAGES_FILE}"
  else
    jq -c --arg f "${filter}" '.[] | select(.id | contains($f))' "${IMAGES_FILE}"
  fi
}

cache_path_for() {
  local id="$1"
  echo "${CACHE_DIR}/$(echo "${id}" | tr '/' '-')"
}

# Run buildx for a single matrix entry.
# mode: "build" (cache only, no push) or "push" (build from cache + push)
run_entry() {
  local entry="$1" mode="$2"
  local id dockerfile context platforms cache_dir
  id="$(jq -r '.id' <<<"${entry}")"
  dockerfile="$(jq -r '.dockerfile' <<<"${entry}")"
  context="$(jq -r '.context' <<<"${entry}")"
  platforms="$(jq -r '.platforms | join(",")' <<<"${entry}")"
  cache_dir="$(cache_path_for "${id}")"
  mkdir -p "${cache_dir}"

  local -a tag_args=()
  while IFS= read -r tag; do
    tag_args+=(--tag "${tag}")
  done < <(jq -r '.tags[]' <<<"${entry}")

  local -a output_args=()
  if [[ "${mode}" == "push" ]]; then
    output_args=(--push)
  else
    output_args=(--output type=cacheonly)
  fi

  log "[${mode}] ${id}  (platforms: ${platforms})"
  (
    cd "${ROOT_DIR}"
    docker buildx build \
      --platform "${platforms}" \
      --file "${dockerfile}" \
      "${tag_args[@]}" \
      --cache-from "type=local,src=${cache_dir}" \
      --cache-to "type=local,dest=${cache_dir},mode=max" \
      "${output_args[@]}" \
      "${context}"
  )
}

cmd_build() { run_matrix "build" "${1:-}"; }
cmd_push()  { run_matrix "push" "${1:-}"; }

run_matrix() {
  local mode="$1" filter="${2:-}"
  local entries
  entries="$(matrix_entries "${filter}")"
  [[ -n "${entries}" ]] || die "No image matches filter '${filter}' in images.json"

  ensure_builder

  while IFS= read -r entry; do
    run_entry "${entry}" "${mode}"
  done <<<"${entries}"

  log "Done (${mode})."
}

cmd_list() {
  jq -r '.[] | "\(.id)\t\(.tags | join(", "))"' "${IMAGES_FILE}" | column -t -s $'\t'
}

cmd_clean() {
  log "Removing local buildx cache (${CACHE_DIR})"
  rm -rf "${CACHE_DIR}"
  if docker buildx inspect "${BUILDER_NAME}" >/dev/null 2>&1; then
    log "Removing buildx builder '${BUILDER_NAME}'"
    docker buildx rm "${BUILDER_NAME}"
  fi
}

usage() {
  sed -n '2,20p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

main() {
  require_bin docker
  require_bin jq
  docker buildx version >/dev/null 2>&1 || die "docker buildx plugin is required."

  local cmd="${1:-}"
  [[ $# -gt 0 ]] && shift || true

  case "${cmd}" in
    build) cmd_build "${1:-}" ;;
    push)  cmd_push "${1:-}" ;;
    login) docker_login ;;
    list)  cmd_list ;;
    clean) cmd_clean ;;
    *) usage; exit 1 ;;
  esac
}

main "$@"
