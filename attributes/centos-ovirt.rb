# centos-release-ovirt43 : CentOS 7
# centos-release-ovirt44 : CentOS 8
ver = node['yum-centos']['ovirt_version']

default['yum']['centos-ovirt']['repositoryid'] = 'centos-ovirt'
default['yum']['centos-ovirt']['description'] = "CentOS-$releasever - oVirt #{ver}"
default['yum']['centos-ovirt']['enabled'] = false
default['yum']['centos-ovirt']['make_cache'] = true
default['yum']['centos-ovirt']['managed'] = false
default['yum']['centos-ovirt']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=#{release_var}&arch=$basearch&repo=virt-ovirt-#{ver}"
default['yum']['centos-ovirt']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Virtualization'
# testing
default['yum']['centos-ovirt-testing']['repositoryid'] = 'centos-ovirt-testing'
default['yum']['centos-ovirt-testing']['description'] = "CentOS-$releasever - oVirt #{ver} - Testing"
default['yum']['centos-ovirt-testing']['enabled'] = false
default['yum']['centos-ovirt-testing']['make_cache'] = true
default['yum']['centos-ovirt-testing']['managed'] = false
default['yum']['centos-ovirt-testing']['gpgcheck'] = false
default['yum']['centos-ovirt-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/#{release_var}/virt/$basearch/ovirt-#{ver}/"
# debuginfo
default['yum']['centos-ovirt-debuginfo']['repositoryid'] = 'centos-ovirt-debuginfo'
default['yum']['centos-ovirt-debuginfo']['description'] = "CentOS-$releasever - oVirt #{ver} - Debuginfo"
default['yum']['centos-ovirt-debuginfo']['enabled'] = false
default['yum']['centos-ovirt-debuginfo']['make_cache'] = true
default['yum']['centos-ovirt-debuginfo']['managed'] = false
default['yum']['centos-ovirt-debuginfo']['baseurl'] =
  "http://debuginfo.centos.org/centos/#{release_var}/virt/$basearch/"
default['yum']['centos-ovirt-debuginfo']['gpgkey'] =
  'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Virtualization'
