# centos-release-qemu-ev : CentOS 7 only
default['yum']['centos-qemu-ev']['repositoryid'] = 'centos-qemu-ev'
default['yum']['centos-qemu-ev']['description'] = 'CentOS-$releasever - QEMU EV'
default['yum']['centos-qemu-ev']['enabled'] = false
default['yum']['centos-qemu-ev']['make_cache'] = true
default['yum']['centos-qemu-ev']['managed'] = false
default['yum']['centos-qemu-ev']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=virt-kvm-common'
default['yum']['centos-qemu-ev']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Virtualization'
# testing
default['yum']['centos-qemu-ev-testing']['repositoryid'] = 'centos-qemu-ev-testing'
default['yum']['centos-qemu-ev-testing']['description'] = 'CentOS-$releasever - QEMU EV - Testing'
default['yum']['centos-qemu-ev-testing']['enabled'] = false
default['yum']['centos-qemu-ev-testing']['make_cache'] = true
default['yum']['centos-qemu-ev-testing']['managed'] = false
default['yum']['centos-qemu-ev-testing']['gpgcheck'] = false
default['yum']['centos-qemu-ev-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/virt/$basearch/kvm-common/'
