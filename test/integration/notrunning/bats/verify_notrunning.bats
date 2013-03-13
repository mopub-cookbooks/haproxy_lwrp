#!/usr/bin/env bats

@test "it should have /usr/sbin/haproxy" {
  [ -x "/usr/sbin/haproxy" ]
}
