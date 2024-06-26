#!/usr/bin/env sh

/usr/local/bin/docker-entrypoint.sh php-fpm &
/usr/bin/nginx -c /etc/nginx/nginx.conf
