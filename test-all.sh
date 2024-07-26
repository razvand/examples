#!/bin/sh

for d in $(find -mindepth 1 -maxdepth 1 -type d); do
    test -f "$d"/test_config
    if test $? -ne 0; then
        echo "No test_config file for $d" 1>&2
        continue
    fi
    echo " * Testing $d ..."
    ./test-one.sh "$d"
done | tee out-test-$(date +"%Y-%m-%d-%H%M")
