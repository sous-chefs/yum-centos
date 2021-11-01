default['yum']['realtime']['repositoryid'] = 'realtime'
default['yum']['realtime']['description'] = "#{centos_description} - RealTime"
default['yum']['realtime']['enabled'] = false
default['yum']['realtime']['make_cache'] = true
default['yum']['realtime']['managed'] = false
default['yum']['realtime']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=RT'
default['yum']['realtime']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
