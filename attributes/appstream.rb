default['yum']['appstream']['repositoryid'] = 'appstream'
default['yum']['appstream']['description'] = "CentOS-#{node['platform_version'].to_i} - AppStream"
default['yum']['appstream']['enabled'] = true
default['yum']['appstream']['make_cache'] = true
default['yum']['appstream']['managed'] = true
default['yum']['appstream']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=AppStream&infra=$infra"
default['yum']['appstream']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
