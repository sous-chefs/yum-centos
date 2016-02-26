default['yum']['contrib']['repositoryid'] = 'contrib'
default['yum']['contrib']['description'] = 'CentOS-$releasever - Contrib'
default['yum']['contrib']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib'
default['yum']['contrib']['enabled'] = false
default['yum']['contrib']['make_cache'] = true
default['yum']['contrib']['managed'] = false
default['yum']['contrib']['gpgcheck'] = true
case node['platform_version'].to_i
when 5
  default['yum']['contrib']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'
when 6
  default['yum']['contrib']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
end
