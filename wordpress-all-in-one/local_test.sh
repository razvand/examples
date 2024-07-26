#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

curl -sL "$url" -o /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
curl -sL "$url" | grep 'WordPress' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
