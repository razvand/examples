#!/bin/sh

. ./test_config

fqdn=$(kraft cloud inst info "$name" -o json | jq -r '.[0].fqdn')
url=https://"$fqdn"

./local_test.sh "$url"

sleep 2
state=$(kraft cloud inst info "$name" -o json | jq -r '.[0].state')
test "$state" = "standby" && echo "standby: PASSED" || echo "standby: FAILED"

./local_test.sh "$url"

sleep 2
state=$(kraft cloud inst info "$name" -o json | jq -r '.[0].state')
test "$state" = "standby" && echo "standby: PASSED" || echo "standby: FAILED"
