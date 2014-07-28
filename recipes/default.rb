#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w[httpd mod_ssl].each do |pkg|
  package pkg do
    action :install
  end
end

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

