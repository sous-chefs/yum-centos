default['yum']['centos-kernel']['repositoryid'] = 'centos-kernel'
default['yum']['centos-kernel']['description'] = 'CentOS LTS Kernels for $basearch'
default['yum']['centos-kernel']['enabled'] = false
default['yum']['centos-kernel']['make_cache'] = true
default['yum']['centos-kernel']['managed'] = false
default['yum']['centos-kernel']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=kernel'
default['yum']['centos-kernel']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
