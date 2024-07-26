#!/bin/bash

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

cd "$name"

grep 'kraft cloud deploy' README.md > /dev/null
if test $? -eq 0; then
    deploy_cmd=$(grep 'kraft cloud deploy' README.md | head -1)
    port_mapping="443:8080"
    grep '\-p' <<< "$deploy_cmd" > /dev/null
    if test $? -eq 0; then
        port_mapping=$(sed 's/^.* -p[ \t]\+\([0-9]\+:[0-9]\+\).*$/\1/g' <<< "$deploy_cmd")
    fi
    memory=256
    grep '\-M' <<< "$deploy_cmd" > /dev/null
    if test $? -eq 0; then
        memory=$(sed 's/^.* -M[ \t]\+\([0-9]\+\).*$/\1/g' <<< "$deploy_cmd")
    fi
else
    echo "No deploy command found" 1>&2
    exit 1
fi

echo "port_mapping=$port_mapping" > test_config
echo "memory=$memory" >> test_config
echo 'name="$(basename "$(realpath .)" | tr -d ".")"' >> test_config

echo "$name/test_config generated:"
echo
cat test_config
