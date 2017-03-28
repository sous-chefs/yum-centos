#
# Author:: Joe Nuspl (<nuspl@nvwls.com>)
# Recipe:: yum-centos::default
#
# Copyright:: 2017, Chef Software, Inc.
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

release = node['platform_version']

%w(base contrib cr extras fasttrack centosplus updates).each do |id|
  dir = (id == 'base' ? 'os' : id)

  node.default['yum'][id]['description'] = "CentOS-#{release} - #{id.capitalize}"
  node.default['yum'][id]['mirrorlist'] = nil
  node.default['yum'][id]['baseurl'] = "http://vault.centos.org/#{release}/#{dir}/$basearch/"
end

include_recipe 'yum-centos::default'
