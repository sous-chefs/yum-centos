default['yum']['fasttrack']['repositoryid'] = 'fasttrack'
default['yum']['fasttrack']['description'] = "CentOS-#{node['platform_version'].to_i} - fasttrack"
default['yum']['fasttrack']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=fasttrack&infra=$infra"
default['yum']['fasttrack']['enabled'] = false
default['yum']['fasttrack']['make_cache'] = true
default['yum']['fasttrack']['managed'] = false
default['yum']['fasttrack']['gpgcheck'] = true
default['yum']['fasttrack']['gpgkey'] =
  if node['platform_version'].to_i >= 8
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
  else
    "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-#{node['platform_version'].to_i}"
  end
