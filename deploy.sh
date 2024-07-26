#!/bin/sh

. ./test_config

set -x
if test -z "$extra"; then
    kraft cloud deploy -p $port_mapping -M "$memory" --name "$name" --subdomain "$name" .
else
    kraft cloud deploy -p $port_mapping -M "$memory" "$extra" --name "$name" --subdomain "$name" .
fi
