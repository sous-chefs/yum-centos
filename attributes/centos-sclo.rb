# centos-release-scl : CentOS 7
default['yum']['centos-sclo']['repositoryid'] = 'centos-sclo'
default['yum']['centos-sclo']['description'] = 'CentOS-$releasever - SCLo sclo'
default['yum']['centos-sclo']['enabled'] = false
default['yum']['centos-sclo']['make_cache'] = true
default['yum']['centos-sclo']['managed'] = false
default['yum']['centos-sclo']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=sclo-sclo'
default['yum']['centos-sclo']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-SCLo'
# testing
default['yum']['centos-sclo-testing']['repositoryid'] = 'centos-sclo-testing'
default['yum']['centos-sclo-testing']['description'] = 'CentOS-$releasever - SCLo sclo - Testing'
default['yum']['centos-sclo-testing']['enabled'] = false
default['yum']['centos-sclo-testing']['make_cache'] = true
default['yum']['centos-sclo-testing']['managed'] = false
default['yum']['centos-sclo-testing']['gpgcheck'] = false
default['yum']['centos-sclo-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/sclo/$basearch/sclo/'
# debuginfo
default['yum']['centos-sclo-debuginfo']['repositoryid'] = 'centos-sclo-debuginfo'
default['yum']['centos-sclo-debuginfo']['description'] = 'CentOS-$releasever - SCLo sclo - Debuginfo'
default['yum']['centos-sclo-debuginfo']['enabled'] = false
default['yum']['centos-sclo-debuginfo']['make_cache'] = true
default['yum']['centos-sclo-debuginfo']['managed'] = false
default['yum']['centos-sclo-debuginfo']['baseurl'] = 'http://debuginfo.centos.org/centos/$releasever/sclo/$basearch/'
default['yum']['centos-sclo-debuginfo']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-SCLo'
