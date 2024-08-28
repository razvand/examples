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
if test -f "end.sh"; then
    ./end.sh > /dev/null 2>&1
else
    ../end.sh > /dev/null 2>&1
fi
echo " * Deploy ..."
if test -f "deploy.sh"; then
    ./deploy.sh
else
    ../deploy.sh
fi
echo " * Wait 5 seconds for deployment ..."
sleep 5
echo " * Test ..."
if test -f "test.sh"; then
    ./test.sh
else
    ../test.sh
fi
echo " * Remove deployment ..."
if test -f "end.sh"; then
    ./end.sh
else
    ../end.sh
fi
