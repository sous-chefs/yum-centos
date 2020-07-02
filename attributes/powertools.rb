default['yum']['powertools']['repositoryid'] = 'powertools'
default['yum']['powertools']['description'] = "CentOS-#{node['platform_version'].to_i} - PowerTools"
default['yum']['powertools']['enabled'] = false
default['yum']['powertools']['make_cache'] = true
default['yum']['powertools']['managed'] = false
default['yum']['powertools']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=PowerTools"
default['yum']['powertools']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
