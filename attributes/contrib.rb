default['yum']['contrib']['repositoryid'] = 'contrib'
default['yum']['contrib']['description'] = 'CentOS-$releasever - Contrib'
default['yum']['contrib']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib'
default['yum']['contrib']['enabled'] = false
default['yum']['contrib']['make_cache'] = true
default['yum']['contrib']['managed'] = false
default['yum']['contrib']['gpgcheck'] = true
default['yum']['contrib']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
