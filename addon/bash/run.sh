#!/usr/bin/env bash
rm -rf /etc/default/locale
env >> /etc/default/locale
/etc/init.d/cron start
#supervisord -c /etc/supervisor/supervisord.conf
#/usr/local/sbin/php-fpm -F
/usr/local/bin/docker-php-entrypoint