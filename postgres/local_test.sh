#!/bin/sh

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url="$1"

echo '\list' | PGPASSWORD=unikraft psql --set=sslmode=require -h $(echo "$url" | sed 's/https\?:\/\///g') -U postgres > /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
echo '\list' | PGPASSWORD=unikraft psql --set=sslmode=require -h $(echo "$url" | sed 's/https\?:\/\///g') -U postgres | grep 'databases' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
