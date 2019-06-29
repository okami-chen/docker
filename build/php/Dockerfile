FROM php:7.3-fpm

RUN apt-get update \
&& apt-get install -y --no-install-recommends libbz2-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
libxml2-dev libtidy-dev libxslt1-dev libzip-dev libsnmp-dev libldap2-dev libc-client-dev libkrb5-dev \
libicu-dev libc-client-dev libkrb5-dev wget vim git snmp apt-utils \
&& wget https://getcomposer.org/composer.phar \
&& mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer \
&& rm -r /var/lib/apt/lists/* \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
&& docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
&& docker-php-ext-install -j$(nproc) bz2 gd soap xmlrpc tidy xsl zip snmp ldap intl \
bcmath calendar exif gettext sockets dba mysqli pcntl pdo_mysql shmop sysvmsg sysvsem sysvshm imap \
&& pecl install redis swoole \
&& composer config -g repo.packagist composer https://packagist.laravel-china.org \
&& cp /usr/bin/clear /usr/bin/cls \
&& echo "alias ll='ls -alh'" >> /root/.bashrc