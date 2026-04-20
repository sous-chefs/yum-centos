# yum-centos Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/yum-centos.svg)](https://supermarket.chef.io/cookbooks/yum-centos)
[![CI State](https://github.com/sous-chefs/yum-centos/workflows/ci/badge.svg)](https://github.com/sous-chefs/yum-centos/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you'd like to know more please visit sous-chefs.org or come chat with us on the Chef Community Slack in `#sous-chefs`.

## Overview

The yum-centos cookbook manages the DNF repository definitions that ship with CentOS Stream.

This cookbook now officially supports CentOS Stream 9 and CentOS Stream 10 only. The supported repo IDs are:

- `baseos`
- `appstream`
- `extras-common`
- `crb`
- `highavailability`
- `nfv`
- `rt`
- `resilientstorage`

Use `yum_centos_repository` to manage one repo and `yum_centos_repositories` to manage the default or full set. For lifecycle and architecture limits, see [LIMITATIONS.md](LIMITATIONS.md).

## Requirements

### Platforms

- CentOS Stream 9
- CentOS Stream 10

### Chef

- Chef 16.10+

### Cookbooks

- none

## Resources

- [yum_centos_repository](documentation/yum-centos_repository.md) manages a single CentOS Stream repo definition.
- [yum_centos_repositories](documentation/yum-centos_repositories.md) manages the default or full supported repo set.

## Usage

Manage the default enabled repo set:

```ruby
yum_centos_repositories 'default'
```

Manage one optional repo directly:

```ruby
yum_centos_repository 'crb' do
  enabled true
end
```

Manage the full supported repo catalog:

```ruby
yum_centos_repositories 'all' do
  repo_ids %w(
    baseos
    appstream
    extras-common
    crb
    highavailability
    nfv
    rt
    resilientstorage
  )

  repo_overrides(
    'crb' => { 'enabled' => true },
    'highavailability' => { 'enabled' => true },
    'nfv' => { 'enabled' => true },
    'rt' => { 'enabled' => true },
    'resilientstorage' => { 'enabled' => true }
  )
end
```

## Migration Notes

This cookbook has been fully migrated to custom resources. The legacy recipes and attribute-driven repository definitions were removed, so new and existing consumers should use `yum_centos_repository` or `yum_centos_repositories` directly.

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
