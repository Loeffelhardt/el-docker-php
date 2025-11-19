# PHP-FPM

# Description

Extends official Spryker PHP Docker images with extensions and tools to be able to run Löffelhardt.

* Based on official PHP images
  * `Alpine 3.22`
  * `Alpine 3.21`
  * `Alpine 3.20`
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
| [loeffelhardt/php:latest](https://hub.docker.com/r/loeffelhardt/php/tags?name=latest)                 | 8.4.13      | Alpine 3.22        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:latest.svg)](https://microbadger.com/images/loeffelhardt/php:latest "Get your own image badge on microbadger.com")                 | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.22/8.4/Dockerfile)     |
| [loeffelhardt/php:8.4](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4)                       | 8.4.13      | Alpine 3.22        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4.svg)](https://microbadger.com/images/loeffelhardt/php:8.4 "Get your own image badge on microbadger.com")                       | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.22/8.4/Dockerfile)     |
| [loeffelhardt/php:8.3](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.3)                       | 8.3.26      | Alpine 3.22        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.3.svg)](https://microbadger.com/images/loeffelhardt/php:8.3 "Get your own image badge on microbadger.com")                       | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.22/8.3/Dockerfile)     |
| [loeffelhardt/php:8.4-alpine3.22](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-alpine3.22) | 8.4.13      | Alpine 3.22        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-alpine3.22.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-alpine3.22 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.22/8.4/Dockerfile)     |
| [loeffelhardt/php:8.3-alpine3.22](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.3-alpine3.22) | 8.3.26      | Alpine 3.22        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.3-alpine3.22.svg)](https://microbadger.com/images/loeffelhardt/php:8.3-alpine3.22 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.22/8.3/Dockerfile)     |
| [loeffelhardt/php:8.4-alpine3.21](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-alpine3.21) | 8.4.13      | Alpine 3.21        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-alpine3.21.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-alpine3.21 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.21/8.4/Dockerfile)     |
| [loeffelhardt/php:8.3-alpine3.21](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.3-alpine3.21) | 8.3.26      | Alpine 3.21        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.3-alpine3.21.svg)](https://microbadger.com/images/loeffelhardt/php:8.3-alpine3.21 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.21/8.3/Dockerfile)     |
| [loeffelhardt/php:8.4-alpine3.20](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-alpine3.20) | 8.4.8       | Alpine 3.20        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-alpine3.20.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-alpine3.20 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.20/8.4/Dockerfile)     |
| [loeffelhardt/php:8.3-alpine3.20](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.3-alpine3.20) | 8.3.17      | Alpine 3.20        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.3-alpine3.20.svg)](https://microbadger.com/images/loeffelhardt/php:8.3-alpine3.20 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.20/8.3/Dockerfile)     |
| [loeffelhardt/php:8.4-debian](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-debian)         | 8.4.11      | Debian "bullseye"  | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-debian.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-debian "Get your own image badge on microbadger.com")         | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/debian/bullseye/8.4/Dockerfile) |
| [loeffelhardt/php:8.3-debian](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.3-debian)         | 8.3.24      | Debian "bullseye"  | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.3-debian.svg)](https://microbadger.com/images/loeffelhardt/php:8.3-debian "Get your own image badge on microbadger.com")         | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/debian/bullseye/8.3/Dockerfile) |
## How to use

### Pull image
```bash
$ docker pull loeffelhardt/php
$ docker pull loeffelhardt/php:8.4
```

### Run container
```bash
$ docker run -i --rm loeffelhardt/php:latest php -v
```

### Dockerfile
```dockerfile
FROM loeffelhardt/php:8.4
```

### docker-compose.yml
```yaml
service1:
    image: loeffelhardt/php:8.3-debian
```

### Enable NewRelic
```dockerfile
FROM loeffelhardt/php:8.4

RUN mv /usr/local/etc/php/disabled/newrelic.ini /usr/local/etc/php/conf.d/90-newrelic.ini
```

### Enable Blackfire
```dockerfile
FROM loeffelhardt/php:8.4

RUN mv /usr/local/etc/php/disabled/blackfire.ini /usr/local/etc/php/conf.d/90-blackfire.ini
```

### Enable Tideways
```dockerfile
FROM loeffelhardt/php:8.4

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
  [x] random
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
 [ ] amqp 2.1.2
 [ ] blackfire 1.87.1~linux-musl-x64-non_zts82
 [ ] excimer 1.2.5
 [ ] newrelic 12.1.0.26
 [ ] otel 
 [ ] pcov 1.0.12
 [ ] tideways 5.30.0-252e30b
 [ ] xhprof 2.3.10

INSTALLED PACKAGES, CHANNEL PECL.PHP.NET:
=========================================
PACKAGE VERSION STATE
amqp    2.1.2   stable
apcu    5.1.27  stable
excimer 1.2.5   stable
pcov    1.0.12  stable
redis   6.2.0   stable
xdebug  3.4.7   stable
xhprof  2.3.10  stable

Composer
====================
Composer version 2.8.12 2025-09-19 13:41:59
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
