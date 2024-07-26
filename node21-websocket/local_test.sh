#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url=wss://$(echo "$1" | sed 's/https:\/\///g')

wscat --connect "$url" > /dev/null < /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
