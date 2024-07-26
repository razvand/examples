#!/bin/sh

. ./test_config

kraft cloud inst rm "$name"
kraft cloud volume rm "$name"-workspace
