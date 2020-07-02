# centos-release-dotnet : CentOS 7 only
default['yum']['centos-dotnet']['repositoryid'] = 'centos-dotnet'
default['yum']['centos-dotnet']['description'] = 'CentOS-$releasever - Dotnet'
default['yum']['centos-dotnet']['enabled'] = false
default['yum']['centos-dotnet']['make_cache'] = true
default['yum']['centos-dotnet']['managed'] = false
default['yum']['centos-dotnet']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=dotnet'
default['yum']['centos-dotnet']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Storage'
