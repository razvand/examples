#!/bin/sh

. ./test_config

kraft cloud deploy \
    --scale-to-zero on \
    --scale-to-zero-stateful \
    --scale-to-zero-cooldown 4s \
    -p $port_mapping \
    -M "$memory" \
    --name "$name" \
    --subdomain "$name" \
    .
