#!/usr/bin/env bats

@test "haproxy should be listening" {
  [ "$(netstat -plant | grep haproxy | grep 2003)" ]
}
