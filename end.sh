#!/bin/sh

. ./test_config

set -x
kraft cloud inst rm "$name"
