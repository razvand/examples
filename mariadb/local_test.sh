#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

. ./test_config

kraft cloud tunnel 3306:"$name":3306 &
sleep 1
echo "show databases;" | mysql -h 127.0.0.1 -u root -punikraft > /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
echo "show databases;" | mysql -h 127.0.0.1 -u root -punikraft | grep 'users' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
kill $!
