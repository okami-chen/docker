FROM php:7.3-fpm
RUN pecl install redis swoole mongodb \
    && docker-php-ext-enable redis swoole mongodb