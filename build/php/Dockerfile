FROM php:7.3-fpm-stretch
RUN pecl install redis swoole mongodb
RUN docker-php-ext-install mysqli pdo_mysql
RUN docker-php-ext-install pcntl exif
RUN docker-php-ext-install sockets
RUN docker-php-ext-install fileinfo
