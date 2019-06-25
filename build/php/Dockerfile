FROM centos

RUN groupadd www-data && useradd -M -g www-data -s /sbin/nologin www-data \
&& rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum update -y \
&& yum install wget libxml2 libxml2-devel openssl openssl-devel bzip2 bzip2-devel libcurl libcurl-devel libjpeg \
libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel readline readline-devel libxslt libxslt-devel \
autoconf gcc bison re2c sqlite-devel libffi-devel icu-devel libicu.x86_64 libicu-devel.x86_64 libicu-doc.noarch \
gcc-c++ oniguruma-devel.x86_64 oniguruma.x86_64 -y \
&& mkdir /soft && cd /soft && wget https://github.com/php/php-src/archive/php-7.4.0alpha1.tar.gz \
&& tar xvf  php-7.4.0alpha1.tar.gz && rm -rf php-7.4.0alpha1.tar.gz && cd php-src-php-7.4.0alpha1 \
&& ./buildconf --force \
&& ./configure \
--prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--enable-fpm \
--with-fpm-user=www-data \
--with-fpm-group=www-data \
--enable-inline-optimization \
--disable-debug \
--disable-rpath \
--enable-shared \
--enable-soap \
--with-xmlrpc \
--with-openssl \
--with-mhash \
--with-zlib \
--enable-bcmath \
--with-iconv \
--with-bz2 \
--enable-calendar \
--with-curl \
--with-cdb \
--enable-dom \
--enable-exif \
--enable-fileinfo \
--enable-filter \
--enable-ftp \
--with-openssl-dir \
--enable-gd-jis-conv \
--with-gettext \
--with-gmp \
--with-mhash \
--enable-json \
--enable-mbstring \
--enable-mbregex \
--enable-pdo \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-zlib-dir \
--with-readline \
--enable-session \
--enable-shmop \
--enable-simplexml \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--with-xsl \
--enable-mysqlnd-compression-support \
--enable-opcache \
--enable-pcntl \
--enable-intl \
--with-ffi \
--enable-exif \
&& make && make install \
&& ln -s /usr/local/php/bin/php-config /usr/bin/php-config \
&& ln -s /usr/local/php/bin/phpize /usr/bin/phpize \
&& ln -s /usr/local/php/bin/php /usr/bin/php \
&& wget https://dl.laravel-china.org/composer.phar -O /usr/local/bin/composer \
&& chmod a+x /usr/local/bin/composer \
&& composer config -g repo.packagist composer https://packagist.laravel-china.org \
&& yum clean all && rm -rf /tmp/* && rm -rf /soft
