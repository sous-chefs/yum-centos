#
# Author:: Sean OMeara (<someara@chef.io>)
# Recipe:: yum-centos::default
#
# Copyright:: 2013-2016, Chef Software, Inc.
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

ruby_block 'xenserver $releasever' do
  only_if { platform?('xenserver') }

  block do
    cmd = shell_out!('rpm -q --provides xenserver-release | ' \
                     'sed -n "s/^centos-release = \(.*\)/\1/p"')

    releasever = cmd.stdout.chomp.sub(/\.el.*/, '').tr('^0-9', '.')

    node.default['yum-centos']['repos'].each do |repo|
      dir = repo == 'base' ? 'os' : repo
      node.default['yum'][repo]['baseurl'] =
        "http://mirror.centos.org/centos/#{releasever}/#{dir}/$basearch/"
    end
  end
end

::Dir['/etc/yum.repos.d/CentOS-*'].each do |f|
  file f do
    action :delete
  end
end

node['yum-centos']['repos'].each do |repo|
  next unless node['yum'][repo]['managed']
  yum_repository repo do
    node['yum'][repo].each do |config, value|
      case config
      when 'managed' # rubocop: disable Lint/EmptyWhen
      when 'baseurl'
        send(config.to_sym, lazy { value })
      else
        send(config.to_sym, value) unless value.nil?
      end
    end
  end
end
