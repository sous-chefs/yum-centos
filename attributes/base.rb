default['yum']['base']['repositoryid'] = 'base'
default['yum']['base']['description'] = 'CentOS-$releasever - Base'
default['yum']['base']['enabled'] = true
default['yum']['base']['make_cache'] = true
default['yum']['base']['managed'] = true
if node['platform_version'].to_i >= 8
  default['yum']['base']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=BaseOS'
  default['yum']['base']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
else
  default['yum']['base']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
  default['yum']['base']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
end
