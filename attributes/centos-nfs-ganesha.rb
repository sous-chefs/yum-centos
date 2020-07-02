# centos-release-nfs-ganesha30 : CentOS 7
# centos-release-nfs-ganesha30 : CentOS 8
ver = node['yum-centos']['nfs_ganesha_version']

default['yum']['centos-nfs-ganesha']['repositoryid'] = 'centos-nfs-ganesha'
default['yum']['centos-nfs-ganesha']['description'] = "CentOS-$releasever - NFS Ganesha #{ver}"
default['yum']['centos-nfs-ganesha']['enabled'] = false
default['yum']['centos-nfs-ganesha']['make_cache'] = true
default['yum']['centos-nfs-ganesha']['managed'] = false
default['yum']['centos-nfs-ganesha']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=storage-nfsganesha-#{ver}"
default['yum']['centos-nfs-ganesha']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Storage'
# testing
default['yum']['centos-nfs-ganesha-testing']['repositoryid'] = 'centos-nfs-ganesha-testing'
default['yum']['centos-nfs-ganesha-testing']['description'] =
  "CentOS-$releasever - NFS Ganesha #{ver} - Testing"
default['yum']['centos-nfs-ganesha-testing']['enabled'] = false
default['yum']['centos-nfs-ganesha-testing']['make_cache'] = true
default['yum']['centos-nfs-ganesha-testing']['managed'] = false
default['yum']['centos-nfs-ganesha-testing']['gpgcheck'] = false
default['yum']['centos-nfs-ganesha-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/$releasever/storage/$basearch/nfsganesha-#{ver}/"
