require 'minitest/autorun'

class Haproxynotrunning < MiniTest::Unit::TestCase
  def haproxy_is_installed
    assert File.exists?("/usr/sbin/haproxy")
  end
  def we_have_a_init_script_called_adserver
    assert File.exists?("/etc/init.d/adserver")
  end
end
