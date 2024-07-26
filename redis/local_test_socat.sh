#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

. ./test_config

fqdn=${url#https://}
socat TCP-LISTEN:6379,bind=127.0.0.1,fork,reuseaddr OPENSSL:"$fqdn":6379 &
sleep 1
echo "ping" | redis-cli > /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
echo "ping" | redis-cli | grep 'PONG' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
kill $!
