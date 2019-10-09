#!/usr/bin/env bash
supervisord -c /etc/supervisor/supervisord.conf
php /www/hpf/bin/hyperf.php start