#!/usr/bin/sed -f

/^rootfs:/ {i \
labels:\
  cloud.unikraft.v1.instances/scale_to_zero.policy: "on"\
  cloud.unikraft.v1.instances/scale_to_zero.stateful: "false"\
  cloud.unikraft.v1.instances/scale_to_zero.cooldown_time_ms: 1000\

}
