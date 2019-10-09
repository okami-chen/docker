#!/usr/bin/env bash
supervisord -c /etc/supervisor/supervisord.conf
php /www/default/bin/hyperf.php start