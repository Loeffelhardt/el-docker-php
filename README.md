# PHP-FPM

[![Docker Stars](https://img.shields.io/docker/stars/loeffelhardt/php.svg)](https://store.docker.com/community/images/loeffelhardt/php)
[![Docker Pulls](https://img.shields.io/docker/pulls/loeffelhardt/php.svg)](https://store.docker.com/community/images/loeffelhardt/php)

# Description

Extends official Spryker PHP Docker images with extensions and tools to be able to run Löffelhardt.

* Based on official PHP images
  * `Alpine 3.18`
  * `Alpine 3.19`
  * `Debian "bullseye"`
  
* Users: `root`, `spryker`
* Working directory: `/data`
* Includes:
  * [PHP extensions](#php-extensions)
  * PostgreSQL client
  * MySQL client
  * CURL
  * OpenSSH client
  * Composer v2

> Note: Provided images require additional configuration for development, staging, and production use.

## Tags

| Tag                                                                                                   | PHP version | Linux distribution | Details                                                                                                                                                                                              | Dockerfile                                                                                         |
|:------------------------------------------------------------------------------------------------------|:------------|:-------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------|
| [loeffelhardt/php:latest](https://hub.docker.com/r/loeffelhardt/php/tags?name=latest)                 | 8.2.15      | Alpine 3.18        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:latest.svg)](https://microbadger.com/images/loeffelhardt/php:latest "Get your own image badge on microbadger.com")                 | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.18/8.2/Dockerfile)     |
| [loeffelhardt/php:8.2](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.2)                       | 8.2.15      | Alpine 3.18        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.1.svg)](https://microbadger.com/images/loeffelhardt/php:8.1 "Get your own image badge on microbadger.com")                       | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.18/8.2/Dockerfile)     |
| [loeffelhardt/php:8.1](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.1)                       | 8.1.27      | Alpine 3.18        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.1.svg)](https://microbadger.com/images/loeffelhardt/php:8.1 "Get your own image badge on microbadger.com")                       | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.18/8.1/Dockerfile)     |
| [loeffelhardt/php:8.2-alpine3.18](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.2-alpine3.18) | 8.2.15      | Alpine 3.18        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.2-alpine3.18.svg)](https://microbadger.com/images/loeffelhardt/php:8.2-alpine3.18 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.18/8.2/Dockerfile)     |
| [loeffelhardt/php:8.1-alpine3.18](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.1-alpine3.18) | 8.1.27      | Alpine 3.18        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.1-alpine3.18.svg)](https://microbadger.com/images/loeffelhardt/php:8.1-alpine3.18 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.18/8.1/Dockerfile)     |
| [loeffelhardt/php:8.2-alpine3.19](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.2-alpine3.19) | 8.2.15      | Alpine 3.19        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.2-alpine3.18.svg)](https://microbadger.com/images/loeffelhardt/php:8.2-alpine3.19 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.19/8.2/Dockerfile)     |
| [loeffelhardt/php:8.1-alpine3.19](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.1-alpine3.19) | 8.1.27      | Alpine 3.19        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.1-alpine3.19.svg)](https://microbadger.com/images/loeffelhardt/php:8.1-alpine3.19 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.19/8.1/Dockerfile)     |
| [loeffelhardt/php:8.2-debian](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.2-debian)         | 8.2.5       | Debian "bullseye"  | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.2-debian.svg)](https://microbadger.com/images/loeffelhardt/php:8.2-debian "Get your own image badge on microbadger.com")         | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/debian/bullseye/8.2/Dockerfile) |
| [loeffelhardt/php:8.1-debian](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.1-debian)         | 8.1.18      | Debian "bullseye"  | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.1-debian.svg)](https://microbadger.com/images/loeffelhardt/php:8.1-debian "Get your own image badge on microbadger.com")         | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/debian/bullseye/8.1/Dockerfile) |
## How to use

### Pull image
```bash
$ docker pull loeffelhardt/php
$ docker pull loeffelhardt/php:8.2
```

### Run container
```bash
$ docker run -i --rm loeffelhardt/php:latest php -v
```

### Dockerfile
```dockerfile
FROM loeffelhardt/php:8.2
```

### docker-compose.yml
```yaml
service1:
    image: loeffelhardt/php:8.2-debian
```

### Enable NewRelic
```dockerfile
FROM loeffelhardt/php:8.2

RUN mv /usr/local/etc/php/disabled/newrelic.ini /usr/local/etc/php/conf.d/90-newrelic.ini
```

### Enable Blackfire
```dockerfile
FROM loeffelhardt/php:8.2

RUN mv /usr/local/etc/php/disabled/blackfire.ini /usr/local/etc/php/conf.d/90-blackfire.ini
```

### Enable Tideways
```dockerfile
FROM loeffelhardt/php:8.2

RUN mv /usr/local/etc/php/disabled/tideways.ini /usr/local/etc/php/conf.d/90-tideways.ini
```

## PHP extensions

```
Installed extensions
====================
  [x] bcmath
  [x] bz2
  [ ] calendar
  [ ] com_dotnet
  [x] ctype
  [x] curl
  [x] date
  [ ] dba
  [ ] dl_test
  [x] dom
  [ ] enchant
  [ ] exif
  [ ] ext_skel.php
  [ ] ffi
  [x] fileinfo
  [x] filter
  [x] ftp
  [x] gd
  [ ] gettext
  [x] gmp
  [x] hash
  [x] iconv
  [ ] imap
  [x] intl
  [x] json
  [ ] ldap
  [x] libxml
  [x] mbstring
  [x] mysqli
  [x] mysqlnd
  [ ] oci8
  [ ] odbc
  [x] opcache
  [x] openssl
  [x] pcntl
  [x] pcre
  [x] pdo
  [ ] pdo_dblib
  [ ] pdo_firebird
  [x] pdo_mysql
  [ ] pdo_oci
  [ ] pdo_odbc
  [x] pdo_pgsql
  [x] pdo_sqlite
  [x] pgsql
  [x] phar
  [x] posix
  [ ] pspell
  [x] readline
  [x] reflection
  [x] session
  [ ] shmop
  [x] simplexml
  [ ] skeleton
  [ ] snmp
  [x] soap
  [x] sockets
  [x] sodium
  [x] spl
  [x] sqlite3
  [x] standard
  [ ] sysvmsg
  [ ] sysvsem
  [ ] sysvshm
  [ ] tidy
  [x] tokenizer
  [x] xml
  [x] xmlreader
  [x] xmlwriter
  [x] xsl
  [ ] zend_test
  [x] zip
  [x] zlib

Disabled extensions
====================
 [ ] blackfire 1.87.1
 [ ] newrelic 10.11.0.3
 [ ] pcov 1.0.11
 [ ] tideways 5.5.14
 [ ] xhprof 2.3.9

INSTALLED PACKAGES, CHANNEL PECL.PHP.NET:
=========================================
PACKAGE VERSION STATE
apcu    5.1.22  stable
pcov    1.0.11  stable
redis   5.3.7   stable
xdebug  3.2.2   stable
xhprof  2.3.9   stable
Composer
====================
Composer version 2.5.8 2023-06-09 17:13:21
```
##### Run the following to get the report
```bash
$ docker run -i --rm loeffelhardt/php:latest bash -s<<'EOF'
    docker-php-source extract
    echo "Installed extensions";
    echo "====================";
    for ext in `ls /usr/src/php/ext`; do echo ' ' `php -r "if (extension_loaded('$ext' !== 'opcache' ? '$ext' : 'Zend OPcache')) { echo '[x] $ext'; } else { echo '[ ] $ext'; }"`; done
    echo "";
    echo "Disabled extensions";
    echo "====================";
    for f in /usr/local/etc/php/disabled/*.ini; do disabled=$(basename $f | sed -e 's/\.ini$//'); echo " [ ] ${disabled} $(PHP_INI_SCAN_DIR=:/usr/local/etc/php/disabled php -r "echo phpversion('${disabled}');")"; done
    echo "";
    pear list -c pecl
    echo "";
    echo "Composer";
    echo "====================";
    composer -V
EOF
```

## More information
* [Spryker documentation](https://documentation.spryker.com)
* [PHP supported versions](http://php.net/supported-versions.php)
* [PHP official images](https://github.com/docker-library/php)
