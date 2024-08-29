#!/bin/sh

. ./test_config

url=https://$(kraft cloud compose ps -o json | jq --raw-output '.[] | select(.name=="'"$name"'") | .fqdn')

curl -s "$url" -o /dev/null && echo "connect: PASSED" || echo "connect: FAILED"
curl -s -X POST -d "key=my-key" -d "value=my-value" "$url" | grep 'Success' > /dev/null && echo "write:   PASSED" || echo "write:   FAILED"
curl -s "$url"?key=my-key | grep 'my-value' > /dev/null && echo "read:    PASSED" || echo "read:    FAILED"
