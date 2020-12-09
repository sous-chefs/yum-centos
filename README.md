# yum-centos Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/yum-centos.svg)](https://supermarket.chef.io/cookbooks/yum-centos)

The yum-centos cookbook takes over management of the default and optional repositoryids that ship with CentOS systems.

Below is a table showing which repositoryids we manage that are shipped by default with CentOS via the centos-release
package:

| Repo ID          | CentOS 7         | CentOS 8         |
| ---------------- | :--------------: | :--------------: |
| appstream        |       :x:        |:heavy_check_mark:|
| base             |:heavy_check_mark:|:heavy_check_mark:|
| centos-kernel    |:heavy_check_mark:|       :x:        |
| centosplus       |:heavy_check_mark:|:heavy_check_mark:|
| contrib          |       :x:        |       :x:        |
| cr               |:heavy_check_mark:|:heavy_check_mark:|
| debuginfo        |:heavy_check_mark:|:heavy_check_mark:|
| extras           |:heavy_check_mark:|:heavy_check_mark:|
| fasttrack        |:heavy_check_mark:|:heavy_check_mark:|
| highavailability |       :x:        |:heavy_check_mark:|
| powertools       |       :x:        |:heavy_check_mark:|
| updates          |:heavy_check_mark:|       :x:        |

Additionally, this cookbook can manage the following CentOS repositories that can *optionally* be installed.  The table
below displays each repositories we support, which platform version they are supported on and what upstream release
package it effectively replaces. Some of these repositories may depend on another related repository. This cookbook
*does not* automatically account for such dependencies and this is up to the user to configure the appropriate
repositories.

While upstream may provide additional versions for the repositories below, we only maintain the current release. Users
are welcome to override those attributes as they see fit for their environment.

| Repo ID                 | CentOS 7         | CentOS 8         | Upstream release package     |
| ----------------------- | :--------------: | :--------------: | ---------------------------- |
| centos-ansible          |:heavy_check_mark:|:heavy_check_mark:| centos-release-ansible-29    |
| centos-azure            |:heavy_check_mark:|       :x:        | centos-release-azure         |
| centos-ceph             |:heavy_check_mark:|:heavy_check_mark:| centos-release-ceph-octopus (C8) <br> centos-release-ceph-nautilus (C7) |
| centos-dotnet           |:heavy_check_mark:|       :x:        | centos-release-dotnet        |
| centos-fdio             |:heavy_check_mark:|       :x:        | centos-release-fdio          |
| centos-gluster          |:heavy_check_mark:|:heavy_check_mark:| centos-release-gluster7      |
| centos-nfs-ganesha      |:heavy_check_mark:|:heavy_check_mark:| centos-release-nfs-ganesha30 |
| centos-openshift-origin |:heavy_check_mark:|       :x:        | centos-release-openshift-origin311 |
| centos-openstack        |:heavy_check_mark:|:heavy_check_mark:| centos-release-openstack-ussuri (C8) <br> centos-release-openstack-train (C7) |
| centos-opstools         |:heavy_check_mark:|:heavy_check_mark:| centos-release-opstools      |
| centos-ovirt            |:heavy_check_mark:|       :x:        | centos-release-ovirt43       |
| centos-qemu-ev          |:heavy_check_mark:|       :x:        | centos-release-qemu-ev       |
| centos-qpid-proton      |       :x:        |:heavy_check_mark:| centos-release-qpid-proton   |
| centos-rabbitmq         |       :x:        |:heavy_check_mark:| centos-release-rabbitmq-38   |
| centos-sclo-rh          |:heavy_check_mark:|       :x:        | centos-release-scl-rh        |
| centos-sclo             |:heavy_check_mark:|       :x:        | centos-release-scl           |
| centos-virt-xen         |:heavy_check_mark:|       :x:        | centos-release-xen-412       |

## Requirements

### Platforms

- CentOS

### Chef

- Chef 12.14+

### Cookbooks

- none

## Attributes

See individual repository attribute files for defaults.

If using the vault recipe, you can set ``node['yum-centos']['vault_repos']``. See below for an example for CentOS 8:

```ruby
# Enable 8.0.1905 vault release
node['yum-centos']['vault_repos']['8.0.1905']['enabled'] = true
node['yum-centos']['vault_repos']['8.0.1905']['managed'] = true
node['yum-centos']['vault_repos']['8.0.1905']['make_cache'] = true

include 'yum-centos::vault'
```

To enable multiple vault releases, you can do the following:
```ruby
node['yum-centos']['vault_repos']['7.8']['enabled'] = true
node['yum-centos']['vault_repos']['7.8']['managed'] = true
node['yum-centos']['vault_repos']['7.8']['make_cache'] = true
node['yum-centos']['vault_repos']['7.9']['enabled'] = true
node['yum-centos']['vault_repos']['7.9']['managed'] = true
node['yum-centos']['vault_repos']['7.9']['make_cache'] = true

include 'yum-centos::vault'
```

The vault repositories only provides binary packages for the previous release which currently defaults to the following:
- CentOS 7: 7.7.1908
- CentOS 8: 8.0.1905

Some repositories provide a version attribute to set which version of the repository to use. Changing these will also
update the version used in ``mirrorlist`` and ``description``.

```ruby
default['yum-centos']['ansible_version'] = '29'
default['yum-centos']['ceph_version'] =
  value_for_platform(%w(centos redhat) =>
  {
      '>= 8.0' => 'octopus',
      '~> 7.0' => 'nautilus',
  })
default['yum-centos']['gluster_version'] = '7'
default['yum-centos']['nfs_ganesha_version'] =
  value_for_platform(%w(centos redhat) =>
  {
      '>= 8.0' => '3',
      '~> 7.0' => '30',
  })
default['yum-centos']['openshift_version'] = '311'
default['yum-centos']['openstack_version'] =
  value_for_platform(%w(centos redhat) =>
  {
      '>= 8.0' => 'ussuri',
      '~> 7.0' => 'train',
  })
default['yum-centos']['opstools_version'] =
  value_for_platform(%w(centos redhat) =>
  {
      '>= 8.0' => '-collectd-5',
      '< 8.0' => '',
  })
default['yum-centos']['ovirt_version'] = '4.3'
default['yum-centos']['rabbitmq_version'] = '38'
default['yum-centos']['virt_xen_version'] =
  value_for_platform(%w(centos redhat) =>
  {
      '~> 7.0' => '412',
  })
```

_NOTE: If you are migrating from using `node['yum-centos']['keep_scl_repositories']`, you will need to do the following
  to enable the repositories using this cookbook:_

```ruby
node.default['yum']['centos-sclo']['enabled'] = true
node.default['yum']['centos-sclo']['managed'] = true
node.default['yum']['centos-sclo-rh']['enabled'] = true
node.default['yum']['centos-sclo-rh']['managed'] = true

include_recipe 'yum-centos'
```

## Recipes

- `yum-centos::default` Generates `yum_repository` configs for latest CentOS release. By default the `base`, `extras`,
  and `updates` repos are enabled on CentOS 7. For CentOS 8, `base`, `extras` and `appstream` repos are enabled by
  default.

_NOTE: If you are running an older CentOS release, i.e. 7.7 when 7.8 is the latest 7.x release, you may want to consider the `yum-centos::vault` recipe._

```ruby
  yum_repository 'base' do
    mirrorlist 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
    description 'CentOS-$releasever - Base'
    enabled true
    gpgcheck true
    gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
  end
```

- `yum-centos::vault` Generate yum configuration for non-current versions of CentOS. Instead of using `mirrorlist`, `baseurl` is set to `http://vault.centos.org/...`.

## Usage Example

To disable the CentOS Extras repository through a Role or Environment definition

```ruby
default_attributes(
  'yum' => {
    'extras' => {
      'enabled' => {
        false
       }
     }
   }
 )
```

Uncommonly used repositoryids are not managed by default. This is speeds up integration testing pipelines by avoiding yum-cache builds that nobody cares about. To enable the CentOS Plus repository with a wrapper cookbook, place the following in a recipe:

```ruby
node.default['yum']['centosplus']['managed'] = true
node.default['yum']['centosplus']['enabled'] = true
include_recipe 'yum-centos'
```

## More Examples

Point the base and updates repositories at an internally hosted server.

```ruby
node.default['yum']['base']['enabled'] = true
node.default['yum']['base']['mirrorlist'] = nil
node.default['yum']['base']['baseurl'] = 'https://internal.example.com/centos/7/os/x86_64'
node.default['yum']['base']['sslverify'] = false
node.default['yum']['updates']['enabled'] = true
node.default['yum']['updates']['mirrorlist'] = nil
node.default['yum']['updates']['baseurl'] = 'https://internal.example.com/centos/7/updates/x86_64'
node.default['yum']['updates']['sslverify'] = false

include_recipe 'yum-centos'
```

## License & Authors

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2011-2016, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
