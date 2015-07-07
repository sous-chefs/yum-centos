default['yum']['cloud']['repositoryid'] = 'cloud'
default['yum']['cloud']['description'] = 'CentOS-$releasever - Cloud'
default['yum']['cloud']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=cloud'
default['yum']['cloud']['enabled'] = false
default['yum']['cloud']['managed'] = false
default['yum']['cloud']['gpgcheck'] = true
case node['platform_version'].to_i
when 5
  default['yum']['cloud']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'
when 6
  default['yum']['cloud']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
when 7
  default['yum']['cloud']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
end
