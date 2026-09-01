# PHP-FPM

# Description

Extends official Spryker PHP Docker images with extensions and tools to be able to run Löffelhardt.

* Based on official PHP images
  * `Alpine 3.23`
  * `Alpine 3.24`
  * `Debian "bookworm"`
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
| [loeffelhardt/php:latest](https://hub.docker.com/r/loeffelhardt/php/tags?name=latest)                 | 8.5.9       | Alpine 3.24        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.5-alpine3.24.svg)](https://microbadger.com/images/loeffelhardt/php:8.5-alpine3.24 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.24/8.5/Dockerfile)     |
| [loeffelhardt/php:8.5](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.5)                       | 8.5.9       | Alpine 3.24        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.5-alpine3.24.svg)](https://microbadger.com/images/loeffelhardt/php:8.5-alpine3.24 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.24/8.5/Dockerfile)     |
| [loeffelhardt/php:8.5-alpine3.24](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.5-alpine3.24) | 8.5.9       | Alpine 3.24        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.5-alpine3.24.svg)](https://microbadger.com/images/loeffelhardt/php:8.5-alpine3.24 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.24/8.5/Dockerfile)     |
| [loeffelhardt/php:8.4](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4)                       | 8.4.24      | Alpine 3.24        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-alpine3.24.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-alpine3.24 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.24/8.4/Dockerfile)     |
| [loeffelhardt/php:8.4-alpine3.24](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-alpine3.24) | 8.4.24      | Alpine 3.24        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-alpine3.24.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-alpine3.24 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.24/8.4/Dockerfile)     |
| [loeffelhardt/php:8.4-alpine3.23](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-alpine3.23) | 8.4.24      | Alpine 3.23        | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-alpine3.23.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-alpine3.23 "Get your own image badge on microbadger.com") | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/alpine/3.23/8.4/Dockerfile)     |
| [loeffelhardt/php:8.5-debian](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.5-debian)         | 8.5.9       | Debian "bookworm"  | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.5-debian.svg)](https://microbadger.com/images/loeffelhardt/php:8.5-debian "Get your own image badge on microbadger.com")         | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/debian/bookworm/8.5/Dockerfile) |
| [loeffelhardt/php:8.4-debian](https://hub.docker.com/r/loeffelhardt/php/tags?name=8.4-debian)         | 8.4.11      | Debian "bullseye"  | [![](https://images.microbadger.com/badges/image/loeffelhardt/php:8.4-debian.svg)](https://microbadger.com/images/loeffelhardt/php:8.4-debian "Get your own image badge on microbadger.com")         | [:link:](https://github.com/loeffelhardt/el-docker-php/blob/master/debian/bullseye/8.4/Dockerfile) |
## How to use

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
 [ ] amqp 2.2.0
 [ ] blackfire 1.87.1~linux-musl-x64-non_zts82
 [ ] excimer 1.2.5
 [ ] imagick 3.8.1
 [ ] newrelic 12.9.0.38
 [ ] otel 
 [ ] pcov 1.0.12
 [ ] tideways 5.42.0
 [ ] xhprof 2.3.10

INSTALLED PACKAGES, CHANNEL PECL.PHP.NET:
=========================================
PACKAGE VERSION STATE
amqp    2.2.0   stable
apcu    5.1.28  stable
excimer 1.2.5   stable
imagick 3.8.1   stable
pcov    1.0.12  stable
redis   6.3.0   stable
xdebug  3.5.1   stable
xhprof  2.3.10  stable

Composer
====================
Composer version 2.10.2
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
