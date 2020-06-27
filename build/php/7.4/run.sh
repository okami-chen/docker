#!/usr/bin/env bash
env >> /etc/default/locale
/etc/init.d/cron start
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
/usr/local/bin/docker-php-entrypoint