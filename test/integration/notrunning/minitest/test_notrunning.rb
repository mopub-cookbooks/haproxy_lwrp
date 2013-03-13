require 'minitest/autorun'
require 'socket'

class NotRunning < MiniTest::Unit::TestCase
  def test_haproxy_is_installed
    assert File.exists?("/usr/sbin/haproxy")
  end
  def test_binding_to_80
    assert TCPServer.new("localhost", 80)
  end
  def test_running_haproxy
    refute system('ps auxwww | grep [h]aproxy')
  end
end
