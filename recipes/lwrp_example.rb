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
