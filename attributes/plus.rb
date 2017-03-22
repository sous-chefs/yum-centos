default['yum']['centosplus']['repositoryid'] = 'centosplus'
default['yum']['centosplus']['description'] = "CentOS-#{node['platform_version'].to_i} - Centosplus"
default['yum']['centosplus']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=centosplus"
default['yum']['centosplus']['enabled'] = false
default['yum']['centosplus']['make_cache'] = true
default['yum']['centosplus']['managed'] = false
default['yum']['centosplus']['gpgcheck'] = true
default['yum']['centosplus']['gpgkey'] = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-#{node['platform_version'].to_i}"
