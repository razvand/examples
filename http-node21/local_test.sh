#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

curl -s "$url" -o /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
curl -s "$url" | grep 'Hello, World!' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
