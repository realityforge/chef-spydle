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

default[:spydle][:user] = "spydle"
default[:spydle][:group] = "spydle"

default[:spydle][:package_url] = "http://repo.fire.dse.vic.gov.au/content/groups/fisg/org/realityforge/spydle/1.0/spydle-1.0-all.jar"
default[:spydle][:package_checksum] = "bb04d6a16afd11c31a6aa79ad3cf6717ce729cba7125c02a84f88a17c43b516f"

default[:spydle][:lib_dir] = "/opt/spydle/lib"
default[:spydle][:conf_dir] = "/opt/spydle/conf.d"
default[:spydle][:probes] = Mash.new

