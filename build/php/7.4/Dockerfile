#FROM php:7.4.0RC4-fpm
FROM php:7.2-fpm
COPY ./run.sh /opt/run.sh
COPY ./sources.list /etc/apt/sources.list
LABEL Author="Eward"
LABEL Version="fpm-7.4"
LABEL Description="PHP FPM 7.4 RC3. All extensions."
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev autoconf make zlib1g zlib1g-dev \
    libtool wget libxml2-dev bzip2 libsodium-dev libedit-dev libsqlite3-dev libssl-dev \
    libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev libxslt1-dev \
    libbz2-dev bison libffi-dev libzip-dev re2c apt-utils libgtk2.0-dev cmake git \
    unzip supervisor libsnmp-dev libtidy-dev libldap2-dev libc-client-dev libkrb5-dev libicu-dev \
    librabbitmq-dev librabbitmq4 libreadline6-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) ldap \
    && docker-php-ext-install -j$(nproc) dba \
    && docker-php-ext-install -j$(nproc) shmop \
    && docker-php-ext-install -j$(nproc) calendar \
    && docker-php-ext-install -j$(nproc) exif \
    && docker-php-ext-install -j$(nproc) gettext \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) sysvsem \
    && docker-php-ext-install -j$(nproc) sysvshm \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) xmlrpc \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) bz2 \
    && pecl install redis swoole mongodb apcu amqp igbinary \
    && docker-php-ext-enable redis swoole mongodb apcu amqp igbinary \
    && wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean && chmod +x /opt/run.sh
