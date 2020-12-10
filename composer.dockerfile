ARG COMPOSER_VERSION
FROM composer:${COMPOSER_VERSION}

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

WORKDIR /var/www/html