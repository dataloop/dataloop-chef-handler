#
# Cookbook Name:: dataloop-chef-handler
# Recipe:: default
#
# Copyright 2016, Dataloop Software INC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef_handler'

cookbook_file "#{node["chef_handler"]["handler_path"]}/dataloop_annotations.rb" do
  source "dataloop_annotations.rb"
  owner "root"
  group "root"
  mode 00755
  action :create
end

chef_handler 'Chef::Handler::Dataloop' do
  source "#{node["chef_handler"]["handler_path"]}/dataloop_annotations.rb"
  arguments [
   :host => node['dataloop_chef_handler']['host'],
   :api_token => node['dataloop_chef_handler']['api_token'],
   :org => node['dataloop_chef_handler']['org'],
   :account => node['dataloop_chef_handler']['account'],
   :stream => node['dataloop_chef_handler']['stream']
  ]
  action :enable
end
