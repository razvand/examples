#!/bin/sh

set -e

export HOME=/root
cd /app
/bin/echo "before starting node"
/usr/bin/node /app/server.js &
/bin/echo "started node"
/usr/sbin/nginx
sleep infinity
