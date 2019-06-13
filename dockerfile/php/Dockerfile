FROM php:7.3-fpm-stretch
RUN pecl install redis swoole \
    && docker-php-ext-enable redis swoole