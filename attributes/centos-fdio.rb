# centos-release-fdio : CentOS 7 only
default['yum']['centos-fdio']['repositoryid'] = 'centos-fdio'
default['yum']['centos-fdio']['description'] = 'CentOS-$releasever - fd.io'
default['yum']['centos-fdio']['enabled'] = false
default['yum']['centos-fdio']['make_cache'] = true
default['yum']['centos-fdio']['managed'] = false
default['yum']['centos-fdio']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=nfv-fdio'
default['yum']['centos-fdio']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-NFV'
# testing
default['yum']['centos-fdio-testing']['repositoryid'] = 'centos-fdio-testing'
default['yum']['centos-fdio-testing']['description'] = 'CentOS-$releasever - fd.io - Testing'
default['yum']['centos-fdio-testing']['enabled'] = false
default['yum']['centos-fdio-testing']['make_cache'] = true
default['yum']['centos-fdio-testing']['managed'] = false
default['yum']['centos-fdio-testing']['gpgcheck'] = false
default['yum']['centos-fdio-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/nfv/$basearch/fdio/'
