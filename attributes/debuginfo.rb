default['yum']['debuginfo']['repositoryid'] = 'debuginfo'
default['yum']['debuginfo']['description'] = "#{centos_description} - Debuginfo"
default['yum']['debuginfo']['baseurl'] = "http://debuginfo.centos.org/#{release_var}/$basearch/"
default['yum']['debuginfo']['enabled'] = false
default['yum']['debuginfo']['make_cache'] = true
default['yum']['debuginfo']['managed'] = false
default['yum']['debuginfo']['gpgcheck'] = true
default['yum']['debuginfo']['gpgkey'] =
  if node['platform_version'].to_i >= 8
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
  else
    'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
  end
