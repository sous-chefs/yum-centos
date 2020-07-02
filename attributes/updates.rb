default['yum']['updates']['repositoryid'] = 'updates'
default['yum']['updates']['description'] = 'CentOS-$releasever - Updates'
default['yum']['updates']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates'
default['yum']['updates']['enabled'] = true
default['yum']['updates']['make_cache'] = true
default['yum']['updates']['managed'] = true
default['yum']['updates']['gpgcheck'] = true
default['yum']['updates']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
