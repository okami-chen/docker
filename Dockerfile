FROM ubuntu:18.04
COPY soft/php-7.4.0alpha1.tar.gz /soft/
ADD ubuntu/source /etc/apt/sources.list
ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig
RUN apt-get -y update  && apt-get  -y upgrade \
&& cd /soft && tar xvf php-7.4.0alpha1.tar.gz && rm -rf php-7.4.0alpha1.tar.gz \
&& apt-get install -y autoconf vim  make zlib1g-dev libtool wget libxml2-dev bzip2 libsodium-dev libedit-dev \
libsqlite3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev \
libmcrypt-dev libmysql++-dev libxslt1-dev libbz2-dev bison libffi-dev libzip-dev re2c apt-utils oniguruma \
libgtk2.0-dev cmake \
&& cd /soft/php-src-php-7.4.0alpha1 && ./buildconf --force \
&& ./configure --prefix=/usr/local/php --enable-intl --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data \
--with-openssl --with-zlib --enable-bcmath --with-curl --enable-exif --with-ffi --enable-ftp  --enable-gd \
--enable-intl --enable-pcntl --with-mysqli --enable-soap --enable-sockets --with-sodium --with-zip --enable-mysqlnd\
--enable-sysvsem --enable-inline-optimization --enable-mbregex --enable-mbstring --with-freetype-dir --with-jpeg-dir \
--with-zlib-dir  --with-libxml-dir --with-readline --enable-session --enable-zip \
&& make && make install \
&& rm -rf /var/cache /soft