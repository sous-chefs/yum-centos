# centos-release-scl-rh : CentOS 7
default['yum']['centos-sclo-rh']['repositoryid'] = 'centos-sclo-rh'
default['yum']['centos-sclo-rh']['description'] = 'CentOS-$releasever - SCLo rh'
default['yum']['centos-sclo-rh']['enabled'] = false
default['yum']['centos-sclo-rh']['make_cache'] = true
default['yum']['centos-sclo-rh']['managed'] = false
default['yum']['centos-sclo-rh']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=sclo-rh'
default['yum']['centos-sclo-rh']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-SCLo'
# testing
default['yum']['centos-sclo-rh-testing']['repositoryid'] = 'centos-sclo-rh-testing'
default['yum']['centos-sclo-rh-testing']['description'] = 'CentOS-$releasever - SCLo rh - Testing'
default['yum']['centos-sclo-rh-testing']['enabled'] = false
default['yum']['centos-sclo-rh-testing']['make_cache'] = true
default['yum']['centos-sclo-rh-testing']['managed'] = false
default['yum']['centos-sclo-rh-testing']['gpgcheck'] = false
default['yum']['centos-sclo-rh-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/sclo/$basearch/rh/'
# debuginfo
default['yum']['centos-sclo-rh-debuginfo']['repositoryid'] = 'centos-sclo-rh-debuginfo'
default['yum']['centos-sclo-rh-debuginfo']['description'] = 'CentOS-$releasever - SCLo rh - Debuginfo'
default['yum']['centos-sclo-rh-debuginfo']['enabled'] = false
default['yum']['centos-sclo-rh-debuginfo']['make_cache'] = true
default['yum']['centos-sclo-rh-debuginfo']['managed'] = false
default['yum']['centos-sclo-rh-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/centos/$releasever/sclo/$basearch/'
default['yum']['centos-sclo-rh-debuginfo']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-SCLo'
