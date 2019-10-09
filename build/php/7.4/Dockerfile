FROM php:7.4.0RC3-fpm-buster
COPY ./run.sh /opt/run.sh
COPY ./sources.list /etc/apt/sources.list
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        autoconf make zlib1g zlib1g-dev libtool wget libxml2-dev bzip2 libsodium-dev libedit-dev \
        libsqlite3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev \
        libxslt1-dev libbz2-dev bison libffi-dev libzip-dev re2c apt-utils \
        libgtk2.0-dev cmake git unzip \
        supervisor \
    && docker-php-ext-install -j$(nproc) pdo mysqli pdo_mysql \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) xmlrpc \
    && docker-php-ext-install -j$(nproc) zip \
    && pecl install redis swoole \
    && docker-php-ext-enable redis swoole \
    && wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && apt-get clean && chmod +x /opt/run.sh