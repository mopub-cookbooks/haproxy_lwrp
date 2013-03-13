require 'minitest/autorun'

class Haproxynotrunning < MiniTest::Unit::TestCase
  def test_haproxy_is_installed
    assert File.exists?("/usr/sbin/haproxy")
  end
  def test_ensure_symlink_called_adserver
    assert File.exists?("/etc/init.d/adserver")
  end
end
