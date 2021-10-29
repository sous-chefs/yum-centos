default['yum']['resilientstorage']['repositoryid'] = 'resilientstorage'
default['yum']['resilientstorage']['description'] = "#{centos_description} - ResilientStorage"
default['yum']['resilientstorage']['enabled'] = false
default['yum']['resilientstorage']['make_cache'] = true
default['yum']['resilientstorage']['managed'] = false
default['yum']['resilientstorage']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=ResilientStorage'
default['yum']['resilientstorage']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
