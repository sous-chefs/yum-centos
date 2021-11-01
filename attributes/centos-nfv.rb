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

# centos-release-nfv-extras : CentOS 8 only
default['yum']['centos-nfv-extras']['repositoryid'] = 'centos-nfv-extras'
default['yum']['centos-nfv-extras']['description'] = 'CentOS-$releasever - NFV extras'
default['yum']['centos-nfv-extras']['enabled'] = false
default['yum']['centos-nfv-extras']['make_cache'] = true
default['yum']['centos-nfv-extras']['managed'] = false
default['yum']['centos-nfv-extras']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$nfvsigdist&arch=$basearch&repo=nfv-network-extras'
default['yum']['centos-nfv-extras']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-NFV'
# testing
default['yum']['centos-nfv-extras-testing']['repositoryid'] = 'centos-nfv-extras-testing'
default['yum']['centos-nfv-extras-testing']['description'] = 'CentOS-$releasever - NFV extras Testing'
default['yum']['centos-nfv-extras-testing']['enabled'] = false
default['yum']['centos-nfv-extras-testing']['make_cache'] = true
default['yum']['centos-nfv-extras-testing']['managed'] = false
default['yum']['centos-nfv-extras-testing']['baseurl'] =
  'http://buildlogs.centos.org/centos/$nfvsigdist/nfv/$basearch/network-extras/'
default['yum']['centos-nfv-extras-testing']['gpgcheck'] = false
# debuginfo
default['yum']['centos-nfv-extras-debuginfo']['repositoryid'] = 'centos-nfv-extras-debuginfo'
default['yum']['centos-nfv-extras-debuginfo']['description'] = 'CentOS-$releasever - NFV extras - Debug'
default['yum']['centos-nfv-extras-debuginfo']['enabled'] = false
default['yum']['centos-nfv-extras-debuginfo']['make_cache'] = true
default['yum']['centos-nfv-extras-debuginfo']['managed'] = false
default['yum']['centos-nfv-extras-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/centos/$nfvsigdist/nfv/$basearch/'
default['yum']['centos-nfv-extras-debuginfo']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-NFV'
