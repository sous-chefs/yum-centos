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

include_recipe 'yum-centos::default'

node['yum-centos']['vault_repos'].each do |release, _config|
  node['yum-centos']['repos'].each do |id|
    next unless node['yum'][id]['managed']
    next unless node['yum-centos']['vault_repos'][release]['managed']
    dir =
      case id
      when 'base'
        value_for_platform(%w(centos redhat xenserver) =>
          {
            '>= 8.0' => 'BaseOS',
            '< 8.0' => 'os',
          })
      when 'appstream'
        'AppStream'
      when 'powertools'
        'PowerTools'
      when 'updates', 'extras', 'centosplus', 'fasttrack'
        id
      else
        next
      end

    yum_repository "centos-vault-#{release}-#{id}" do
      description "CentOS-#{release} Vault - #{id.capitalize}"
      case node['platform_version'].to_i
      when 6, 7
        baseurl "http://vault.centos.org/#{release}/#{dir}/$basearch/"
        gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
      when 8
        baseurl "http://vault.centos.org/#{release}/#{dir}/$basearch/os/"
        gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
      end
      node['yum-centos']['vault_repos'][release].each do |config, value|
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
end
