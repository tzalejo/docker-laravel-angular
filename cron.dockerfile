ARG PHP_VERSION
ARG PHP_VARIANTE
FROM php:${PHP_VERSION}-${PHP_VARIANTE}
LABEL maintainer="tzalejo@gmail.com"
LABEL version="1.0"

# Install php extensions
RUN set -e; \
        apk add --no-cache \
        postgresql-dev 
        
RUN docker-php-ext-install pdo pdo_mysql pgsql pdo_pgsql 
COPY crontab /etc/crontabs/root
CMD ["crond", "-f"]
