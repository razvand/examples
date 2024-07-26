#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

. ./test_config

fqdn=${url#https://}
socat TCP-LISTEN:11211,bind=127.0.0.1,fork,reuseaddr OPENSSL:"$fqdn":11211 > /dev/null 2>&1 &
sleep 1
echo "set test 0 0 1" | telnet 127.0.0.1 11211 > /dev/null 2>&1 && echo "connect: PASSED" || echo "connect: FAILED"
kill $!
