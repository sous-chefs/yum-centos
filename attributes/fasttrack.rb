default['yum']['fasttrack']['repositoryid'] = 'fasttrack'
default['yum']['fasttrack']['description'] = 'CentOS-$releasever - fasttrack'
default['yum']['fasttrack']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra'
default['yum']['fasttrack']['enabled'] = false
default['yum']['fasttrack']['make_cache'] = true
default['yum']['fasttrack']['managed'] = false
default['yum']['fasttrack']['gpgcheck'] = true
case node['platform_version'].to_i
when 5
  default['yum']['fasttrack']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'
when 6
  default['yum']['fasttrack']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
when 7
  default['yum']['fasttrack']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
end
