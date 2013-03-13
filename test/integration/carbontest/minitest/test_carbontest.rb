require 'minitest/autorun'
require 'socket'

class Haproxynotrunning < MiniTest::Unit::TestCase
  def test_haproxy_installation
    assert File.exists?("/usr/sbin/haproxy")
  end
  def test_init_script_called_carbon
    assert File.exists?("/etc/init.d/carbon")
  end
end
