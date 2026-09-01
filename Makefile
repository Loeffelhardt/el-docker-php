SHELL := /usr/bin/env bash
SCRIPT := scripts/build-images.sh

.PHONY: help list login build push build-push clean

help: ## Show this help
	@echo "Usage: make <target> [IMAGE=<id>]"
	@echo
	@echo "IMAGE is an optional filter matched against the 'id' field in images.json"
	@echo "(e.g. IMAGE=alpine/3.24/8.5, IMAGE=alpine, IMAGE=debian). Omit for all images."
	@echo
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  %-12s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

list: ## List all images/tags defined in images.json
	@$(SCRIPT) list

login: ## Log in to Docker Hub (prompts for username/password or token)
	@$(SCRIPT) login

build: ## Build images and warm the local buildx cache (no push). Use IMAGE=<id> to filter.
	@$(SCRIPT) build "$(IMAGE)"

push: ## (Re)build from cache and push images to Docker Hub. Use IMAGE=<id> to filter.
	@$(SCRIPT) push "$(IMAGE)"

build-push: build push ## Run build then push in sequence.

clean: ## Remove the local buildx builder and cache
	@$(SCRIPT) clean
