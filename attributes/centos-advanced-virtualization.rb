# centos-release-advanced-virtualization
default['yum']['centos-advanced-virtualization']['repositoryid'] = 'centos-advanced-virtualization'
default['yum']['centos-advanced-virtualization']['description'] = 'CentOS-$releasever - Advanced Virtualization'
default['yum']['centos-advanced-virtualization']['enabled'] = false
default['yum']['centos-advanced-virtualization']['make_cache'] = true
default['yum']['centos-advanced-virtualization']['managed'] = false
default['yum']['centos-advanced-virtualization']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$avstream&arch=$basearch&repo=virt-$avdir'
default['yum']['centos-advanced-virtualization']['gpgkey'] =
  'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Virtualization'
default['yum']['centos-advanced-virtualization']['options']['module_hotfixes'] = '1'
# testing
default['yum']['centos-advanced-virtualization-testing']['repositoryid'] = 'centos-advanced-virtualization-testing'
default['yum']['centos-advanced-virtualization-testing']['description'] =
  'CentOS-$releasever - Advanced Virtualization Testing'
default['yum']['centos-advanced-virtualization-testing']['enabled'] = false
default['yum']['centos-advanced-virtualization-testing']['make_cache'] = true
default['yum']['centos-advanced-virtualization-testing']['managed'] = false
default['yum']['centos-advanced-virtualization-testing']['baseurl'] =
  'http://buildlogs.centos.org/centos/$avstream/virt/$basearch/$avdir/'
default['yum']['centos-advanced-virtualization-testing']['gpgcheck'] = false
default['yum']['centos-advanced-virtualization-testing']['options']['module_hotfixes'] = '1'
# debug
default['yum']['centos-advanced-virtualization-debuginfo']['repositoryid'] = 'centos-advanced-virtualization-debuginfo'
default['yum']['centos-advanced-virtualization-debuginfo']['description'] =
  'CentOS-$releasever - Advanced Virtualization Debug'
default['yum']['centos-advanced-virtualization-debuginfo']['enabled'] = false
default['yum']['centos-advanced-virtualization-debuginfo']['make_cache'] = true
default['yum']['centos-advanced-virtualization-debuginfo']['managed'] = false
default['yum']['centos-advanced-virtualization-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/centos/$avstream/virt/$basearch/'
default['yum']['centos-advanced-virtualization-debuginfo']['gpgcheck'] = false
