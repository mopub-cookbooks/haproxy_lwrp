name "haproxy_lwrp"
maintainer        "Scott M. Likens"
maintainer_email  "scott@likens.us"
license           "Apache 2.0"
description       "Installs and configures haproxy"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "2.0.1"
supports 'ubuntu', "= 12.04"
recipe "haproxy", "Installs and configures haproxy"

depends "runit"
