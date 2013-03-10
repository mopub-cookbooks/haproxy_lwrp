#!/usr/bin/env bats

@test "haproxy should be listening on 80" {
  [ "$(netstat -plant | grep haproxy | grep 80)" ]
}
@test "haproxy should be listening 443" {
  [ "$(netstat -plant | grep haproxy | grep 80)" ]
}

