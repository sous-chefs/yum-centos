# centos-release-opstools : CentOS 7
# centos-release-opstools : CentOS 8
ver = node['yum-centos']['opstools_version'].to_s

default['yum']['centos-opstools']['repositoryid'] = 'centos-opstools'
default['yum']['centos-opstools']['description'] = 'CentOS-$releasever - OpsTools'
default['yum']['centos-opstools']['enabled'] = false
default['yum']['centos-opstools']['make_cache'] = true
default['yum']['centos-opstools']['managed'] = false
default['yum']['centos-opstools']['mirrorlist'] =
  if node['platform_version'].to_i >= 8
    "http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=opstools#{ver}"
  else
    "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=opstools#{ver}"
  end
default['yum']['centos-opstools']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-OpsTools'
# testing
default['yum']['centos-opstools-testing']['repositoryid'] = 'centos-opstools-testing'
default['yum']['centos-opstools-testing']['description'] = 'CentOS-$releasever - OpsTools - Testing'
default['yum']['centos-opstools-testing']['enabled'] = false
default['yum']['centos-opstools-testing']['make_cache'] = true
default['yum']['centos-opstools-testing']['managed'] = false
default['yum']['centos-opstools-testing']['gpgcheck'] = false
default['yum']['centos-opstools-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/$releasever/opstools/$basearch/#{ver.gsub(/^-/, '')}"
