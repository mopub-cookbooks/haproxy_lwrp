#
# Cookbook Name:: haproxy
# Recipe:: install
#
# Copyright 2013, Scott M. Likens

package "haproxy"

template "/etc/default/haproxy" do
  source "haproxy-default.erb"
  owner "root"
  group "root"
  mode 0644
end
