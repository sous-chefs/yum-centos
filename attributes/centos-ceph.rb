# centos-release-ceph-nautilus : CentOS 7
# centos-release-ceph-octopus  : CentOS 8
ver = node['yum-centos']['ceph_version'].to_s

default['yum']['centos-ceph']['repositoryid'] = 'centos-ceph'
default['yum']['centos-ceph']['description'] = "CentOS-$releasever - Ceph #{ver.capitalize}"
default['yum']['centos-ceph']['enabled'] = false
default['yum']['centos-ceph']['make_cache'] = true
default['yum']['centos-ceph']['managed'] = false
default['yum']['centos-ceph']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=#{release_var}&arch=$basearch&repo=storage-ceph-#{ver}"
default['yum']['centos-ceph']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Storage'
# testing
default['yum']['centos-ceph-testing']['repositoryid'] = 'centos-ceph-testing'
default['yum']['centos-ceph-testing']['description'] = "CentOS-$releasever - Ceph #{ver.capitalize} - Testing"
default['yum']['centos-ceph-testing']['enabled'] = false
default['yum']['centos-ceph-testing']['make_cache'] = true
default['yum']['centos-ceph-testing']['managed'] = false
default['yum']['centos-ceph-testing']['gpgcheck'] = false
default['yum']['centos-ceph-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/#{release_var}/storage/$basearch/ceph-#{ver}/"
