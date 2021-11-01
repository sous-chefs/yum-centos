# centos-release-samba
ver = node['yum-centos']['samba_version']

default['yum']['centos-samba']['repositoryid'] = 'centos-samba'
default['yum']['centos-samba']['description'] = "CentOS-$releasever - Samba #{ver}"
default['yum']['centos-samba']['enabled'] = false
default['yum']['centos-samba']['make_cache'] = true
default['yum']['centos-samba']['managed'] = false
default['yum']['centos-samba']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=#{release_var}&arch=$basearch&repo=storage-samba-#{ver}"
default['yum']['centos-samba']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Storage'
# testing
default['yum']['centos-samba-testing']['repositoryid'] = 'centos-samba-testing'
default['yum']['centos-samba-testing']['description'] = "CentOS-$releasever - Samba #{ver} - Testing"
default['yum']['centos-samba-testing']['enabled'] = false
default['yum']['centos-samba-testing']['make_cache'] = true
default['yum']['centos-samba-testing']['managed'] = false
default['yum']['centos-samba-testing']['gpgcheck'] = false
default['yum']['centos-samba-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/#{release_var}/storage/$basearch/samba-#{ver}/"
