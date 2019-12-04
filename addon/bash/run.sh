#!/usr/bin/env bash
supervisord -c /etc/supervisor/supervisord.conf
cron
php-fpm