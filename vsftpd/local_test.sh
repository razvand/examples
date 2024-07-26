#!/bin/bash

if test $# -ne 1; then
    echo "$0 url" 1>&2
    exit 1
fi

url=ftps://$(echo "$1" | sed 's/https:\/\///g')

echo "ls" | lftp -u ftpuser,ftpuserpass -p 21 "$url" > /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
echo "ls" | lftp -u ftpuser,ftpuserpass -p 21 "$url" | grep hello.txt > /dev/null 2>&1 && echo "connect: PASSED" || echo "connect: FAILED"
