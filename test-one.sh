#!/bin/sh

if test $# -ne 1; then
    echo "$0 name" 1>&2
    exit 1
fi

name="$1"

test -d "$name"
if test $? -ne 0; then
    echo "No such directory $name" 1>&2
    exit 1
fi

test -f "$name/Kraftfile"
if test $? -ne 0; then
    echo "No Kraftfile in $name directory" 1>&2
    exit 1
fi

test -f "$name/test_config"
if test $? -ne 0; then
    echo "No test_config in $name directory" 1>&2
    exit 1
fi

test -f "$name/local_test.sh"
if test $? -ne 0; then
    echo "No local_test.sh in $name directory" 1>&2
    exit 1
fi

cd "$name"
echo " * Remove previous deployment (if any) ..."
../end.sh > /dev/null 2>&1
echo " * Deploy ..."
../deploy.sh
echo " * Test ..."
../test.sh
echo " * Remove deployment ..."
../end.sh
