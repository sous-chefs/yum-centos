# centos-release-gluster7
ver = node['yum-centos']['gluster_version']

default['yum']['centos-gluster']['repositoryid'] = 'centos-gluster'
default['yum']['centos-gluster']['description'] = "CentOS-$releasever - Gluster #{ver}"
default['yum']['centos-gluster']['enabled'] = false
default['yum']['centos-gluster']['make_cache'] = true
default['yum']['centos-gluster']['managed'] = false
default['yum']['centos-gluster']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=storage-gluster-#{ver}"
default['yum']['centos-gluster']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Storage'
# testing
default['yum']['centos-gluster-testing']['repositoryid'] = 'centos-gluster-testing'
default['yum']['centos-gluster-testing']['description'] = "CentOS-$releasever - Gluster #{ver} - Testing"
default['yum']['centos-gluster-testing']['enabled'] = false
default['yum']['centos-gluster-testing']['make_cache'] = true
default['yum']['centos-gluster-testing']['managed'] = false
default['yum']['centos-gluster-testing']['gpgcheck'] = false
default['yum']['centos-gluster-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/$releasever/storage/$basearch/gluster-#{ver}/"
