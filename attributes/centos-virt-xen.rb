# centos-release-xen-412 : CentOS 7
ver = node['yum-centos']['virt_xen_version']

default['yum']['centos-virt-xen']['repositoryid'] = 'centos-virt-xen'
default['yum']['centos-virt-xen']['description'] = 'CentOS-$releasever - xen'
default['yum']['centos-virt-xen']['enabled'] = false
default['yum']['centos-virt-xen']['make_cache'] = true
default['yum']['centos-virt-xen']['managed'] = false
default['yum']['centos-virt-xen']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=virt-xen-#{ver}"
default['yum']['centos-virt-xen']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Virtualization'
# testing
default['yum']['centos-virt-xen-testing']['repositoryid'] = 'centos-virt-xen-testing'
default['yum']['centos-virt-xen-testing']['description'] = 'CentOS-$releasever - xen - Testing'
default['yum']['centos-virt-xen-testing']['enabled'] = false
default['yum']['centos-virt-xen-testing']['make_cache'] = true
default['yum']['centos-virt-xen-testing']['managed'] = false
default['yum']['centos-virt-xen-testing']['gpgcheck'] = false
default['yum']['centos-virt-xen-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/$releasever/virt/$basearch/xen-#{ver}"
