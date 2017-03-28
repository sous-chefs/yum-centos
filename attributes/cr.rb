default['yum']['cr']['repositoryid'] = 'cr'
default['yum']['cr']['description'] = "CentOS-#{node['platform_version'].to_i} - Continuous Release"
default['yum']['cr']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=cr"
default['yum']['cr']['enabled'] = false
default['yum']['cr']['make_cache'] = true
default['yum']['cr']['managed'] = false
default['yum']['cr']['gpgcheck'] = true
default['yum']['cr']['gpgkey'] = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-#{node['platform_version'].to_i}"
