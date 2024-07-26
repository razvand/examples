#!/bin/sh

. ./test_config

fqdn=$(kraft cloud inst info "$name" -o json | jq -r '.[0].fqdn')
url=https://"$fqdn"

./local_test.sh "$url"
