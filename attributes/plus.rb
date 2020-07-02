default['yum']['centosplus']['repositoryid'] = 'centosplus'
default['yum']['centosplus']['description'] = 'CentOS-$releasever - Centosplus'
default['yum']['centosplus']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus'
default['yum']['centosplus']['enabled'] = false
default['yum']['centosplus']['make_cache'] = true
default['yum']['centosplus']['managed'] = false
default['yum']['centosplus']['gpgcheck'] = true
default['yum']['centosplus']['gpgkey'] =
  if node['platform_version'].to_i >= 8
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
  else
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
  end
