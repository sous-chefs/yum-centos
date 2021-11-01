default['yum']['extras']['repositoryid'] = 'extras'
default['yum']['extras']['description'] = "#{centos_description} - Extras"
default['yum']['extras']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=#{release_var}&arch=$basearch&repo=extras"
default['yum']['extras']['enabled'] = true
default['yum']['extras']['make_cache'] = true
default['yum']['extras']['managed'] = true
default['yum']['extras']['gpgcheck'] = true
default['yum']['extras']['gpgkey'] =
  if node['platform_version'].to_i >= 8
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
  else
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
  end
