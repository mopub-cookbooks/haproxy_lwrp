require 'minitest/spec'

describe_recipe 'haproxy_test::default' do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "verify haproxy is installed" do
    it "it should create /usr/sbin/haproxy" do
      file("/usr/sbin/haproxy").must_exist
    end
    it "should create /etc/default/haproxy" do
      file("/etc/default/haproxy").must_exist
    end
  end
  describe "verify adserver-haproxy is running" do
    it "should have haproxy running" do
      service("adserver").must_be_running
    end
    it "should have /etc/haproxy/adserver.cfg" do
      file("/etc/haproxy/adserver.cfg").must_exist
    end
  end
end
