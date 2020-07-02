# centos-release-nfv-common : CentOS 7 only
default['yum']['centos-nfv-common']['repositoryid'] = 'centos-nfv-common'
default['yum']['centos-nfv-common']['description'] = 'CentOS-$releasever - nfv common'
default['yum']['centos-nfv-common']['enabled'] = false
default['yum']['centos-nfv-common']['make_cache'] = true
default['yum']['centos-nfv-common']['managed'] = false
default['yum']['centos-nfv-common']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=nfv-common'
default['yum']['centos-nfv-common']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-NFV'
# testing
default['yum']['centos-nfv-common-testing']['repositoryid'] = 'centos-nfv-common-testing'
default['yum']['centos-nfv-common-testing']['description'] = 'CentOS-$releasever - nfv common - Testing'
default['yum']['centos-nfv-common-testing']['enabled'] = false
default['yum']['centos-nfv-common-testing']['make_cache'] = true
default['yum']['centos-nfv-common-testing']['managed'] = false
default['yum']['centos-nfv-common-testing']['gpgcheck'] = false
default['yum']['centos-nfv-common-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/nfv/$basearch/nfv-common/'
