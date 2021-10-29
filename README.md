# yum-centos Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/yum-centos.svg)](https://supermarket.chef.io/cookbooks/yum-centos)
[![CI State](https://github.com/sous-chefs/yum-centos/workflows/ci/badge.svg)](https://github.com/sous-chefs/yum-centos/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit sous-chefs.org or come chat with us on the Chef Community Slack in #sous-chefs.

## Overview

The yum-centos cookbook takes over management of the default and optional repositoryids that ship with CentOS and CentOS
Stream systems.

Below is a table showing which repositoryids we manage that are shipped by default with CentOS via the centos-release
package:

| Repo ID          | CentOS 7         | CentOS 8         | CentOS Stream 8  |
| ---------------- | :--------------: | :--------------: | :--------------: |
| appstream        |       :x:        |:heavy_check_mark:|:heavy_check_mark:|
| base             |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
| centos-kernel    |:heavy_check_mark:|       :x:        |       :x:        |
| centosplus       |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
| contrib          |       :x:        |       :x:        |       :x:        |
| cr               |:heavy_check_mark:|:heavy_check_mark:|       :x:        |
| debuginfo        |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
| extras           |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
| fasttrack        |:heavy_check_mark:|:heavy_check_mark:|       :x:        |
| highavailability |       :x:        |:heavy_check_mark:|:heavy_check_mark:|
| powertools       |       :x:        |:heavy_check_mark:|:heavy_check_mark:|
| realtime         |       :x:        |       :x:        |:heavy_check_mark:|
| resilientstorage |       :x:        |       :x:        |:heavy_check_mark:|
| updates          |:heavy_check_mark:|       :x:        |       :x:        |

Additionally, this cookbook can manage the following CentOS repositories that can *optionally* be installed.  The table
below displays each repositories we support, which platform version they are supported on and what upstream release
package it effectively replaces. Some of these repositories may depend on another related repository. This cookbook
*does not* automatically account for such dependencies and this is up to the user to configure the appropriate
repositories.

While upstream may provide additional versions for the repositories below, we only maintain the current release. Users
are welcome to override those attributes as they see fit for their environment.

| Repo ID                        | CentOS 7         | CentOS 8         | CentOS Stream 8  | Upstream release package               |
| ------------------------------ | :--------------: | :--------------: | :--------------: | -------------------------------------- |
| centos-advanced-virtualization |       :x:        |:heavy_check_mark:|:heavy_check_mark:| centos-release-advanced-virtualization |
| centos-ansible                 |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-ansible-29              |
| centos-azure                   |:heavy_check_mark:|       :x:        |       :x:        | centos-release-azure                   |
| centos-ceph                    |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-ceph-pacific (C8/CS8) <br> centos-release-ceph-nautilus (C7) |
| centos-dotnet                  |:heavy_check_mark:|       :x:        |       :x:        | centos-release-dotnet                  |
| centos-fdio                    |:heavy_check_mark:|       :x:        |       :x:        | centos-release-fdio                    |
| centos-gluster                 |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-gluster9                |
| centos-hyperscale              |       :x:        |       :x:        |:heavy_check_mark:| centos-release-hyperscale              |
| centos-nfs-ganesha             |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-nfs-ganesha30           |
| centos-nfv-extras              |       :x:        |:heavy_check_mark:|:heavy_check_mark:| centos-release-nfv-extras              |
| centos-openshift-origin        |:heavy_check_mark:|       :x:        |       :x:        | centos-release-openshift-origin311     |
| centos-openstack               |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-openstack-xena (CS8) <br> centos-release-openstack-victoria (C8) <br> centos-release-openstack-train (C7) |
| centos-opstools                |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-opstools                |
| centos-ovirt                   |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:| centos-release-ovirt44 (C8/CS8) <br> centos-release-ovirt43 (C7) |
| centos-qemu-ev                 |:heavy_check_mark:|       :x:        |       :x:        | centos-release-qemu-ev                 |
| centos-qpid-proton             |       :x:        |:heavy_check_mark:|:heavy_check_mark:| centos-release-qpid-proton             |
| centos-rabbitmq                |       :x:        |:heavy_check_mark:|:heavy_check_mark:| centos-release-rabbitmq-38             |
| centos-samba                   |       :x:        |:heavy_check_mark:|:heavy_check_mark:| centos-release-samba415                |
| centos-sclo-rh                 |:heavy_check_mark:|       :x:        |       :x:        | centos-release-scl-rh                  |
| centos-sclo                    |:heavy_check_mark:|       :x:        |       :x:        | centos-release-scl                     |
| centos-virt-xen                |:heavy_check_mark:|       :x:        |       :x:        | centos-release-xen-414                 |

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

- CentOS 7: 7.8.2003
- CentOS 8: 8.3.2011

NOTE: CentOS Stream does not provide binaries via the vault repo

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
  and `updates` repos are enabled on CentOS 7. For CentOS 8 and CentOS Stream 8, `base`, `extras` and `appstream` repos
  are enabled by default.

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

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
