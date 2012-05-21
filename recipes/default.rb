#
# Copyright Peter Donald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"

group node[:spydle][:group] do
end

user node[:spydle][:user] do
  comment "Spydle Server Monitor"
  gid node[:spydle][:group]
  home node[:spydle][:base_dir]
  shell "/bin/bash"
end

directory node[:spydle][:lib_dir] do
  owner node[:spydle][:user]
  group node[:spydle][:group]
  mode "0500"
  recursive true
end

directory node[:spydle][:conf_dir] do
  owner node[:spydle][:user]
  group node[:spydle][:group]
  mode "0500"
  recursive true
end

target_package_filename = "#{node[:spydle][:lib_dir]}/#{File.basename(node[:spydle][:package_url])}"
remote_file target_package_filename do
  source node[:spydle][:package_url]
  checksum node[:spydle][:package_checksum]
  owner node[:spydle][:user]
  group node[:spydle][:group]
  mode "0600"
  not_if { ::File.exists?(target_package_filename) }
end

template "/etc/init/spydle.conf" do
  source "upstart.conf.erb"
  mode "0644"
end

service "spydle" do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :restart => true, :stop => true, :status => true
  action [:enable, :start]
end