#!/bin/sh

. ./test_config

url=https://$(kraft cloud compose ps -o json | jq --raw-output '.[] | select(.name=="'"$name"'") | .fqdn')/hello

curl -s "$url" -o /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
curl -s "$url" | grep 'Tyk GW' > /dev/null && echo "message: PASSED" || echo "message: FAILED"
