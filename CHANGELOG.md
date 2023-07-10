# yum-centos Cookbook CHANGELOG

This file is used to list changes made in each version of the yum-centos cookbook.

## Unreleased

## 5.2.5 - *2023-07-10*

## 5.2.4 - *2023-05-17*

## 5.2.3 - *2023-05-02*

## 5.2.2 - *2023-05-02*

## 5.2.1 - *2022-12-18*

- Remove testing for CentOS 8 (EOL'd)
   - Will remove support in the next major release
- Fix workflow CI
- Fix mirrorlist for centos-opstools, centos-qpid-proton & centosplus for EL8
- Remove fasttrack for EL8

## 5.2.0 - *2021-11-01*

- CentOS Stream 8 support
- New repos for CS8 only: realtime, resilientstorage, centos-hyperscale
- New repos for CS8/C8: centos-advanced-virtualization, centos-nfv-extras, centos-samba
- Update OpenStack, oVirt, Xen, GlusterFS and Ceph releases
- Update vault version for C8

## 5.1.2 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 5.1.1 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 5.1.0 - *2021-02-25*

- Sous Chefs Adoption

## 5.0.0 (2020-12-09)

- Remove CentOS 6 support
- Update vault repo versions to latest
- MDL fixes
- Cleanup metadata.rb formatting

## 4.0.2 (2020-07-21)

- Fix Chef 12 compatibility (resolves #42)
- Kitchen suite for testing against Chef 12

## 4.0.1 (2020-07-20)

- ChefSpec test for non-RHEL systems to ensure compile-time issues are caught
- Add return in both recipes if the platform family is not RHEL
- Ensure requiring on cookbook for non-RHEL systems does not return an error (resolves #39)

## 4.0.0 (2020-07-17)

- Add various SIG repos
- Suite and InSpec tests for vault recipe
- Add support for multiple release vaults (resolves #28)
- Changed to using $releasever instead of using ``node['platform_version'].to_i``
- Remove appended ``&infra=$infra`` to mirrorlist URLs as they are not required and make testing easier
- Update InSpec tests to use yum.repo where it makes sense
- Re-enable debuginfo and cr repos for CentOS 8 now that they are available
- Breaking Change: Remove ``node['yum-centos']['keep_scl_repositories']`` attribute since we manage SCL repos directly now
- Breaking Change: Remove support for XenServer
- Fix vault recipe and add ``node['yum-centos']['vault_repos']`` attribute for setting which version to use. By default use previous release.

## 3.2.0 (2019-10-14)

- Add support for CentOS 8 - [@ramereth](https://github.com/ramereth)

## 3.1.0 (2019-04-11)

- Add new keep_scl_repositories flag to prevent deleting repos installed through centos-release-scl-rh and centos-release-scl - [@scalp42](https://github.com/scalp42)

## 3.0.0 (2018-02-16)

- Require Chef 12.14+ and remove compat_resource dep

## 2.3.0 (2017-06-15)

- Adjust repository defaults for XenServer
- Updated Chefspecs to avoid deprecation warnings

## 2.2.0 (2017-03-28)

- Remove releasever use to eliminate requirement of centos-release package.
- Add vault recipe to support running older OS versions without mixing installation of packages.

## 2.1.0 (2016-12-22)

- Allow the use of any valid property via attributes
- Depend on the latest `compat_resource` cookbook
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

- #11 - Fix CentOS 7 support and refactor tests to use server spec

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

- Adding .repo extensions to the /etc/yum.repos.d/CentOS-\* files

## v0.2.0 (2014-02-14)

- Updating test harness

## v0.1.4

- Version bump for tool chain sanity

## v0.1.2

- Adding CHANGELOG.md

## v0.1.0

- initial release
