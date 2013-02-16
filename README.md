Description
===========

Installs haproxy and prepares the configuration location.

Changes
=======

## v1.0.3:

* [COOK-620] haproxy::app_lb's template should use the member cloud private IP by default

## v1.0.2:

* fix regression introduced in v1.0.1

## v1.0.1:

* account for the case where load balancer is in the pool

## v1.0.0:

* Use `node.chef_environment` instead of `node['app_environment']`

## v2.0.0:

* Add Basic LWRP

Requirements
============

## Platform

Tested on Ubuntu 8.10 and higher.

## Cookbooks:

Usage
==================

See tests or `recipe/lwrp_example.rb` for working examples.

	frontend_temp=Array.new  
frontend_temp << {"name" => "http-in *:80", "acl" => "acl bob-acl path_beg /status\nacl bob-acl2 path_beg /status2 if bob-acl\n", "default_backend" => "www" }  
	frontend_temp << {"name" => "https-in *:443", "default_backend" => "www" }  
	backend_temp=Array.new  
	backend_temp << { "name" => "www", "mode" => "http", "balance" => "leastconn" , "option" => "option httpclose\noption redispatch\noption httpchk GET / HTTP/1.1\\r\\nHost: wwww\noption redispatch\n", "other" => "check", "server" => ["172.29.11.3","172.29.11.4"], "start_port" => 80, "instance_count" => 1}  
	backend_temp << { "name" => "https", "mode" => "tcp", "balance" => "leastconn" , "option" => "option httpclose\noption redispatch\noption httpchk GET / HTTP/1.1\\r\\nHost: wwww\noption redispatch\n", "other" => "check", "server" => ["127.0.0.1"], "maxconn" => 2, "start_port" => 443, "instance_count" => 1}  
	backend_temp << { "name" => "unicorn", "mode" => "tcp", "balance" => "leastconn" , "option" => "option httpclose\noption redispatch\noption httpchk GET / HTTP/1.1\\r\\nHost: wwww\noption redispatch\n", "other" => "check", "server" => ["127.0.0.1"], "maxconn" => 20, "start_port" => 8080, "instance_count" => 1}  
	backend_temp << { "name" => "manythins", "mode" => "tcp", "balance" => "leastconn" , "option" => "option httpclose\noption redispatch\noption httpchk GET / HTTP/1.1\\r\\nHost: wwww\noption redispatch\n", "other" => "check", "server" => ["127.0.0.1"], "maxconn" => 20, "start_port" => 3000, "instance_count" => 4}  
	listen_temp=Array.new  
	listen_temp <<   {"name" => "fart 0.0.0.0:22002", "mode" => "http", "stats" => "stats uri /"}  
	include_recipe "haproxy::install"  
	include_recipe "runit"  
    haproxy_lb "adserver" do  
      frontend(frontend_temp)  
      backend(backend_temp)  
      listen(listen_temp)  
      action :create  
    end  

License and Author
==================

Author:: Scott M. Likens (<scott@likens.us>)
Previous Author:: Joshua Timberman (<joshua@opscode.com>)

Copyright:: 2013, Scott M. Likens.
Copyright:: 2009-2011, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
