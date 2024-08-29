#!/bin/sh

set -x
kraft cloud compose create
kraft cloud inst start tyk-tyk
kraft cloud inst start tyk-redis
