#!/bin/sh

. ./test_config

set -x
kraft cloud inst rm "$name"
sleep 2
kraft cloud volume rm "$name"
