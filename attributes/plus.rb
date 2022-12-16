default['yum']['centosplus']['repositoryid'] = 'centosplus'
default['yum']['centosplus']['description'] = 'CentOS-$releasever - Centosplus'
default['yum']['centosplus']['enabled'] = false
default['yum']['centosplus']['make_cache'] = true
default['yum']['centosplus']['managed'] = false
default['yum']['centosplus']['gpgcheck'] = true
if node['platform_version'].to_i >= 8
  default['yum']['centosplus']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=core-centos-plus'
  default['yum']['centosplus']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
else
  default['yum']['centosplus']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus'
  default['yum']['centosplus']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
end
