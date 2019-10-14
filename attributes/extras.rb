default['yum']['extras']['repositoryid'] = 'extras'
default['yum']['extras']['description'] = "CentOS-#{node['platform_version'].to_i} - Extras"
default['yum']['extras']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=extras&infra=$infra"
default['yum']['extras']['enabled'] = true
default['yum']['extras']['make_cache'] = true
default['yum']['extras']['managed'] = true
default['yum']['extras']['gpgcheck'] = true
default['yum']['extras']['gpgkey'] =
  if node['platform_version'].to_i >= 8
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
  else
    "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-#{node['platform_version'].to_i}"
  end
