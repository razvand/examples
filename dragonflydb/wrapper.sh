#!/bin/bash

/usr/bin/mount -t cgroup2 none /sys/fs/cgroup
/usr/bin/dragonfly --maxmemory 256MiB
