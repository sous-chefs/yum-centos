default['yum']['extras']['repositoryid'] = 'extras'
default['yum']['extras']['description'] = 'CentOS-$releasever - Extras'
default['yum']['extras']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras'
default['yum']['extras']['enabled'] = true
default['yum']['extras']['make_cache'] = true
default['yum']['extras']['managed'] = true
default['yum']['extras']['gpgcheck'] = true
case node['platform_version'].to_i
when 5
  default['yum']['extras']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'
when 6
  default['yum']['extras']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
when 7
  default['yum']['extras']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
end
