#FROM ubuntu:18.04
#COPY soft/php-7.4.0alpha1.tar.gz /soft/
#ADD ubuntu/source /etc/apt/sources.list
#ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig
#RUN apt-get -y update  && apt-get  -y upgrade \
#&& cd /soft && tar xvf php-7.4.0alpha1.tar.gz && rm -rf php-7.4.0alpha1.tar.gz \
#&& apt-get install -y autoconf vim  make zlib1g-dev libtool wget libxml2-dev bzip2 libsodium-dev libedit-dev \
#libsqlite3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev \
#libmcrypt-dev libmysql++-dev libxslt1-dev libbz2-dev bison libffi-dev libzip-dev re2c apt-utils oniguruma \
#libgtk2.0-dev cmake \
#&& cd /soft/php-src-php-7.4.0alpha1 && ./buildconf --force \
#&& ./configure --prefix=/usr/local/php --enable-intl --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data \
#--with-openssl --with-zlib --enable-bcmath --with-curl --enable-exif --with-ffi --enable-ftp  --enable-gd \
#--enable-intl --enable-pcntl --with-mysqli --enable-soap --enable-sockets --with-sodium --with-zip --enable-mysqlnd\
#--enable-sysvsem --enable-inline-optimization --enable-mbregex --enable-mbstring --with-freetype-dir --with-jpeg-dir \
#--with-zlib-dir  --with-libxml-dir --with-readline --enable-session --enable-zip \
#&& make && make install \
#&& rm -rf /var/cache /soft

FROM php:7.4.0RC3-fpm-buster
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        autoconf vim  make zlib1g-dev libtool wget libxml2-dev bzip2 libsodium-dev libedit-dev \
        libsqlite3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev \
        libxslt1-dev libbz2-dev bison libffi-dev libzip-dev re2c apt-utils \
        libgtk2.0-dev cmake git unzip \
        supervisor \
    && docker-php-ext-install -j$(nproc) bcmath \
#    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis swoole zip \
    && docker-php-ext-enable redis swoole zip \
    && wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && apt-get clean