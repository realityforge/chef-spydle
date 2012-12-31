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

require 'json'

notifying_action :create do
  config = {:type => new_resource.type}
  config['stage'] = new_resource.stage if new_resource.stage
  config['period'] = new_resource.period if new_resource.period
  config['config'] = new_resource.config if new_resource.config
  file "#{node['spydle']['conf_dir']}/#{new_resource.name}.json" do
    mode '0400'
    owner node['spydle']['user']
    group node['spydle']['group']
    content JSON.pretty_generate(config)
    notifies :restart, 'service[spydle]', :delayed
  end
end

notifying_action :destroy do
  file "#{node['spydle']['conf_dir']}/#{new_resource.name}.json" do
    action :delete
    backup false
  end
end
