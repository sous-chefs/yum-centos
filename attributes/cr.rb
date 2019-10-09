default['yum']['cr']['repositoryid'] = 'cr'
default['yum']['cr']['description'] = "CentOS-#{node['platform_version'].to_i} - Continuous Release"
default['yum']['cr']['enabled'] = false
default['yum']['cr']['make_cache'] = true
default['yum']['cr']['managed'] = false
default['yum']['cr']['gpgcheck'] = true
if node['platform_version'].to_i >= 8
  default['yum']['cr']['baseurl'] = "http://mirror.centos.org/$contentdir/#{node['platform_version'].to_i}/cr/$basearch/os/"
  default['yum']['cr']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
else
  default['yum']['cr']['mirrorlist'] = "http://mirrorlist.centos.org/?release=#{node['platform_version'].to_i}&arch=$basearch&repo=cr"
  default['yum']['cr']['gpgkey'] = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-#{node['platform_version'].to_i}"
end
