# CentOS Stream 8 only
# centos-release-hyperscale
default['yum']['centos-hyperscale']['repositoryid'] = 'centos-hyperscale'
default['yum']['centos-hyperscale']['description'] = 'CentOS Stream $releasever - Hyperscale'
default['yum']['centos-hyperscale']['enabled'] = false
default['yum']['centos-hyperscale']['make_cache'] = true
default['yum']['centos-hyperscale']['managed'] = false
default['yum']['centos-hyperscale']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=hyperscale-packages-main'
default['yum']['centos-hyperscale']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-HyperScale'

# centos-release-hyperscale-experimental
default['yum']['centos-hyperscale-experimental']['repositoryid'] = 'centos-hyperscale-experimental'
default['yum']['centos-hyperscale-experimental']['description'] =
  'CentOS Stream $releasever - Hyperscale Experimental'
default['yum']['centos-hyperscale-experimental']['enabled'] = false
default['yum']['centos-hyperscale-experimental']['make_cache'] = true
default['yum']['centos-hyperscale-experimental']['managed'] = false
default['yum']['centos-hyperscale-experimental']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=hyperscale-packages-experimental'
default['yum']['centos-hyperscale-experimental']['gpgkey'] =
  'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-HyperScale'

# centos-release-hyperscale-hotfixes
default['yum']['centos-hyperscale-hotfixes']['repositoryid'] = 'centos-hyperscale-hotfixes'
default['yum']['centos-hyperscale-hotfixes']['description'] = 'CentOS Stream $releasever - Hyperscale Hotfixes'
default['yum']['centos-hyperscale-hotfixes']['enabled'] = false
default['yum']['centos-hyperscale-hotfixes']['make_cache'] = true
default['yum']['centos-hyperscale-hotfixes']['managed'] = false
default['yum']['centos-hyperscale-hotfixes']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=hyperscale-packages-hotfixes'
default['yum']['centos-hyperscale-hotfixes']['gpgkey'] =
  'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-HyperScale'

# centos-release-hyperscale-spin
default['yum']['centos-hyperscale-spin']['repositoryid'] = 'centos-hyperscale-spin'
default['yum']['centos-hyperscale-spin']['description'] = 'CentOS Stream $releasever - Hyperscale Spin'
default['yum']['centos-hyperscale-spin']['enabled'] = false
default['yum']['centos-hyperscale-spin']['make_cache'] = true
default['yum']['centos-hyperscale-spin']['managed'] = false
default['yum']['centos-hyperscale-spin']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=hyperscale-packages-spin'
default['yum']['centos-hyperscale-spin']['gpgkey'] =
  'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-HyperScale'
