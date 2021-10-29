# centos-release-openstack-train    : CentOS 7
# centos-release-openstack-victoria : CentOS 8
# centos-release-openstack-xena     : CentOS Stream 8
ver = node['yum-centos']['openstack_version'].to_s

default['yum']['centos-openstack']['repositoryid'] = 'centos-openstack'
default['yum']['centos-openstack']['description'] =
  "CentOS-$releasever - OpenStack #{ver.capitalize}"
default['yum']['centos-openstack']['enabled'] = false
default['yum']['centos-openstack']['make_cache'] = true
default['yum']['centos-openstack']['managed'] = false
default['yum']['centos-openstack']['exclude'] = 'sip,PyQt4'
default['yum']['centos-openstack']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=#{release_var}&arch=$basearch&repo=cloud-openstack-#{ver}"
default['yum']['centos-openstack']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Cloud'
# testing
default['yum']['centos-openstack-testing']['repositoryid'] = 'centos-openstack-testing'
default['yum']['centos-openstack-testing']['description'] = "CentOS-$releasever - OpenStack #{ver} - Testing"
default['yum']['centos-openstack-testing']['enabled'] = false
default['yum']['centos-openstack-testing']['make_cache'] = true
default['yum']['centos-openstack-testing']['managed'] = false
default['yum']['centos-openstack-testing']['gpgcheck'] = false
default['yum']['centos-openstack-testing']['exclude'] = 'sip,PyQt4'
default['yum']['centos-openstack-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/#{release_var}/cloud/$basearch/openstack-#{ver}/"
# debuginfo
default['yum']['centos-openstack-debuginfo']['repositoryid'] = 'centos-openstack-debuginfo'
default['yum']['centos-openstack-debuginfo']['description'] =
  "CentOS-$releasever - OpenStack #{ver.capitalize} - Debuginfo"
default['yum']['centos-openstack-debuginfo']['enabled'] = false
default['yum']['centos-openstack-debuginfo']['make_cache'] = true
default['yum']['centos-openstack-debuginfo']['managed'] = false
default['yum']['centos-openstack-debuginfo']['exclude'] = 'sip,PyQt4'
default['yum']['centos-openstack-debuginfo']['baseurl'] =
  "http://debuginfo.centos.org/centos/#{release_var}/cloud/$basearch/"
default['yum']['centos-openstack-debuginfo']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Cloud'
