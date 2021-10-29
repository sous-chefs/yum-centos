default['yum']['powertools']['repositoryid'] = 'powertools'
default['yum']['powertools']['description'] = "#{centos_description} - PowerTools"
default['yum']['powertools']['enabled'] = false
default['yum']['powertools']['make_cache'] = true
default['yum']['powertools']['managed'] = false
default['yum']['powertools']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=#{release_var}&arch=$basearch&repo=PowerTools"
default['yum']['powertools']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
