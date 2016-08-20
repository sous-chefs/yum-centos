default['yum']['fasttrack']['repositoryid'] = 'fasttrack'
default['yum']['fasttrack']['description'] = 'CentOS-$releasever - fasttrack'
default['yum']['fasttrack']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra'
default['yum']['fasttrack']['enabled'] = false
default['yum']['fasttrack']['make_cache'] = true
default['yum']['fasttrack']['managed'] = false
default['yum']['fasttrack']['gpgcheck'] = true
default['yum']['fasttrack']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
