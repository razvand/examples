#!/bin/sh

. ./test_config

kraft cloud volume create \
    --name "$name"-workspace \
    --size 1Gi

kraft cloud deploy \
    --scale-to-zero on \
    --scale-to-zero-stateful \
    --scale-to-zero-cooldown 3s \
    --name "$name" \
    -M "$memory" \
    -p 20:20/tls \
    -p 21:21/tls \
    -p 222:22/tls \
    -p 990:990/tls \
    -p 10100:10100/tls \
    -v "$name"-workspace:/home/ftpuser \
    .
