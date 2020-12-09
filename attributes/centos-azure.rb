# centos-release-azure : CentOS 7
default['yum']['centos-azure']['repositoryid'] = 'centos-azure'
default['yum']['centos-azure']['description'] = 'CentOS-$releasever - Azure'
default['yum']['centos-azure']['enabled'] = false
default['yum']['centos-azure']['make_cache'] = true
default['yum']['centos-azure']['managed'] = false
default['yum']['centos-azure']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=virt-azure'
default['yum']['centos-azure']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Virtualization'
# testing
default['yum']['centos-azure-testing']['repositoryid'] = 'centos-azure-testing'
default['yum']['centos-azure-testing']['description'] = 'CentOS-$releasever - Azure - Testing'
default['yum']['centos-azure-testing']['enabled'] = false
default['yum']['centos-azure-testing']['make_cache'] = true
default['yum']['centos-azure-testing']['managed'] = false
default['yum']['centos-azure-testing']['gpgcheck'] = false
default['yum']['centos-azure-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/virt/$basearch/azure/'
