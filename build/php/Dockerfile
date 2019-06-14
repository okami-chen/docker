FROM php:7.3-fpm
RUN pecl install redis swoole mongodb
RUN docker-php-ext-install mysqli pdo_mysql
RUN docker-php-ext-install pcntl exif
RUN docker-php-ext-install ldap
