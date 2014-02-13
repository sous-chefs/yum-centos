default['yum']['base']['repositoryid'] = 'base'
default['yum']['base']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
default['yum']['base']['description'] = 'CentOS-$releasever - Base'
default['yum']['base']['enabled'] = true
default['yum']['base']['managed'] = true
default['yum']['base']['gpgcheck'] = true
case node['platform_version'].to_i
when 5
  default['yum']['base']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'
when 6
  default['yum']['base']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
end
