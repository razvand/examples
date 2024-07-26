#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

. ./test_config

kraft cloud tunnel 27017:"$name":27017 &
sleep 1
echo "show databases" | mongosh > /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
echo "show databases" | mongosh | grep 'admin' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
kill $!
