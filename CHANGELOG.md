# yum-centos Cookbook CHANGELOG

This file is used to list changes made in each version of the yum-centos cookbook.

## 2.1.0 (2016-12-22)

- Allow the use of any valid property via attributes
- Depend on the latest compat_resource cookbook
- Cookstyle fixes

## 2.0.0 (2016-11-25)
- Replace yum dependency with compat_resource

## 1.0.0 (2016-09-06)
- Add chef_version metadata
- Testing updates
- Remove support for Chef 11
- Generate the GPG path dynamically

## v0.4.13 (2016-07-22)

- loosen the version dependency on yum to allow for newer versions

## v0.4.12 (2015-12-07)

- updated to actually utilize the `make_cache` option from the yum cookbook

## v0.4.11 (2015-12-07)

- Use releasever yum variable for the path to the GPG key to avoid a case statement in the cookbook attributes file

## v0.4.10 (2015-12-01)

- Updating if/unless logic in recipes

## v0.4.9 (2015-10-27)

- Cleaning up Chef 13 deprecation warnings by not passing nil into
- yum_repository properties

## v0.4.8 (2015-10-27)

- Adding redhat platform to attributes file

## v0.4.7 (2015-09-22)

- Added source_url and issues_url metadata
- Added the standard chef rubocop config
- Added standard Chef gitignore and chefignore files
- Add Travis CI and cookbook version badges in the readme
- Expand the requirements section in the readme
- Update contributing, maintainers, and testing docs
- Add standard Gemfile with testing and development dependencies
- Update distro versions in the Kitchen config
- Update berksfile API endpoint
- Add platform support to metadata
- Add long_desciption to metadata

## v0.4.6 (2015-07-17)

- Fixing attribute precedence bug

## v0.4.5 (2015-07-03)

- contrib fix for < 7.0

## v0.4.4 (2015-07-02)

- # 11 - Fix CentOS 7 support and refactor tests to use server spec

## v0.4.3 (2015-06-21)

- Check for RHEL platform_family when installing repos

## v0.4.1 (2015-05-20)

- Changing repo list to attribute array

## v0.4.0 (2015-02-22)

- Adding fasttrack repo management

## v0.3.0 (2014-09-02)

- Add all attribute available to LWRP to allow for tuning
- Added Support for CentOS 7

## v0.2.2 (2014-02-28)

Adding .repo extensions to the /etc/yum.repos.d/CentOS-* files

## v0.2.0 (2014-02-14)

Updating test harness

## v0.1.4

Version bump for tool chain sanity

## v0.1.2

Adding CHANGELOG.md

## v0.1.0

initial release
