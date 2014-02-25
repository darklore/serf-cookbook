#
# Cookbook Name:: serf-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'unzip' do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/serf.zip" do
  source "https://dl.bintray.com/mitchellh/serf/" + node[:serf][:version] + "_linux_" + node[:serf][:arch] + ".zip"
end

execute 'unzip serf' do
  command "unzip -qo #{Chef::Config[:file_cache_path]}/serf.zip"
  cwd "#{Chef::Config[:file_cache_path]}"
end

remote_file '/usr/local/bin/serf' do
  source "file://#{Chef::Config[:file_cache_path]}/serf"
  owner 'root'
  group 'root'
  mode '0755'
end
