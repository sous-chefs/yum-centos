# centos-release-ansible-29 : CentOS 7
# centos-release-ansible-29 : CentOS 8
ver = node['yum-centos']['ansible_version']

default['yum']['centos-ansible']['repositoryid'] = 'centos-ansible'
default['yum']['centos-ansible']['description'] = "CentOS Configmanagement SIG - #{ver}"
default['yum']['centos-ansible']['enabled'] = false
default['yum']['centos-ansible']['make_cache'] = true
default['yum']['centos-ansible']['managed'] = false
default['yum']['centos-ansible']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=configmanagement-ansible-#{ver}"
default['yum']['centos-ansible']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-ConfigManagement'
# testing
default['yum']['centos-ansible-testing']['repositoryid'] = 'centos-ansible-testing'
default['yum']['centos-ansible-testing']['description'] = "CentOS Configmanagement SIG - ansible#{ver} - Testing"
default['yum']['centos-ansible-testing']['enabled'] = false
default['yum']['centos-ansible-testing']['make_cache'] = true
default['yum']['centos-ansible-testing']['managed'] = false
default['yum']['centos-ansible-testing']['gpgcheck'] = false
default['yum']['centos-ansible-testing']['baseurl'] =
  "http://buildlogs.centos.org/centos/$releasever/configmanagement/$basearch/ansible-#{ver}/"
# debuginfo
default['yum']['centos-ansible-debuginfo']['repositoryid'] = 'centos-ansible-debuginfo'
default['yum']['centos-ansible-debuginfo']['description'] = "CentOS Configmanagement SIG - ansible#{ver} - Debuginfo"
default['yum']['centos-ansible-debuginfo']['enabled'] = false
default['yum']['centos-ansible-debuginfo']['make_cache'] = true
default['yum']['centos-ansible-debuginfo']['managed'] = false
default['yum']['centos-ansible-debuginfo']['gpgcheck'] = false
default['yum']['centos-ansible-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/$contentdir/$releasever/configmanagement/$basearch/'
