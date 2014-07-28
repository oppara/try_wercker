require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
  end
  c.path = "/sbin:/usr/sbin"
end


%w{httpd mod_ssl}.each do |package_name|
  describe package(package_name) do
    it { should be_installed }
  end
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

%w{80 443}.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end

