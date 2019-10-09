#!/usr/bin/env bash
php /www/default/bin/hyperf.php start
supervisord -c /etc/supervisor/supervisord.conf