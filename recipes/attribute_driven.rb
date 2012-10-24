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

include_recipe 'spydle::default'

node['spydle']['probes'].each_pair do |key, config|
  config = config.to_hash
  spydle_probe key do
    type config['type']
    stage config['stage'] if config['stage']
    period config['period'] if config['period']
    config config['config'] if config['config']
  end
end

probe_names = node['spydle']['probes'].keys.collect { |p| "#{p}.json" }
::Dir.entries(node['spydle']['conf_dir']).each do |entry|
  if ::File.file?(entry) && entry =~ /.*\.json$/ && !probe_names.include?(File.basename(entry))
    file entry do
      action :delete
      backup false
    end
  end
end if File.exist?(node['spydle']['conf_dir'])
