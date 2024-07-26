#!/bin/sh

. ./test_config

set -x
kraft cloud deploy -p $port_mapping -M "$memory" --name "$name" --subdomain "$name" .
