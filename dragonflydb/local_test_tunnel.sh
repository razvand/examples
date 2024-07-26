#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

. ./test_config

kraft cloud tunnel 6379:"$name":6379 &
sleep 1
echo "ping" | redis-cli > /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
echo "ping" | redis-cli | grep 'PONG' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
kill $!
