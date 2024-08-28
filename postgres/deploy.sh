#!/bin/sh

. ./test_config

set -x
kraft cloud volume create --name "$name" --size 200
kraft cloud deploy -p $port_mapping -M "$memory" -e POSTGRES_PASSWORD=unikraft -e PGDATA=/volume/postgres -v postgres:/volume --name "$name" --subdomain "$name" .
