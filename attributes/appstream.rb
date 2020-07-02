default['yum']['appstream']['repositoryid'] = 'appstream'
default['yum']['appstream']['description'] = 'CentOS-$releasever - AppStream'
default['yum']['appstream']['enabled'] = true
default['yum']['appstream']['make_cache'] = true
default['yum']['appstream']['managed'] = true
default['yum']['appstream']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=AppStream'
default['yum']['appstream']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
