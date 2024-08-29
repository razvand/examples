#!/bin/sh

set -x
kraft cloud compose create
kraft cloud inst start http-go122-redis-redis
kraft cloud inst start http-go122-redis-app
