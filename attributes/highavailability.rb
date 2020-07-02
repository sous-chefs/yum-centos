default['yum']['highavailability']['repositoryid'] = 'highavailability'
default['yum']['highavailability']['description'] = 'CentOS-$releasever - HA'
default['yum']['highavailability']['enabled'] = false
default['yum']['highavailability']['make_cache'] = true
default['yum']['highavailability']['managed'] = false
default['yum']['highavailability']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=HighAvailability'
default['yum']['highavailability']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
