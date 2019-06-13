FROM ubuntu:18.04
COPY soft/php-src-php-7.4.0alpha1.tar.gz /soft/
ADD ubuntu/source /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y

RUN cd /soft && tar xvf php-src-php-7.4.0alpha1.tar.gz && rm -rf php-src-php-7.4.0alpha1.tar.gz
RUN apt-get install -f autoconf vim  make zlib1g-dev libtool wget libxml2-dev bzip2 libsodium-dev libedit-dev libsqlite3-dev libssl-dev libcurl4-openssl-dev \
    && libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev libt1-dev libmcrypt-dev libmysql++-dev libxslt1-dev libbz2-dev bison libffi-dev libzip-dev \
    && re2c -y \
    && ./buildconf --force
    && ./configure --prefix=/usr/local/php --enable-intl --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --with-openssl --with-zlib --enable-bcmath --with-curl --enable-exif --with-ffi --enable-ftp  --enable-gd  --enable-intl --enable-pcntl --with-mysqli --enable-soap --enable-sockets --with-sodium --with-zip --enable-mysqlnd