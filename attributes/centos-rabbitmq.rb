# centos-release-rabbitmq-38 : CentOS 8 Only
ver = node['yum-centos']['rabbitmq_version']

default['yum']['centos-rabbitmq']['repositoryid'] = 'centos-rabbitmq'
default['yum']['centos-rabbitmq']['description'] = "CentOS-$releasever - RabbitMQ #{ver}"
default['yum']['centos-rabbitmq']['enabled'] = false
default['yum']['centos-rabbitmq']['make_cache'] = true
default['yum']['centos-rabbitmq']['managed'] = false
default['yum']['centos-rabbitmq']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=messaging-rabbitmq-#{ver}"
# The Messaging SIG is currently in planning/onboarding so the key only exists in the release package or the git repo
# https://wiki.centos.org/SpecialInterestGroup/Messaging
default['yum']['centos-rabbitmq']['gpgkey'] =
  'https://git.centos.org/rpms/centos-release-messaging/raw/c8-sig-messaging/f/SOURCES/RPM-GPG-KEY-CentOS-SIG-Messaging'
# testing
default['yum']['centos-rabbitmq-testing']['repositoryid'] = 'centos-rabbitmq-testing'
default['yum']['centos-rabbitmq-testing']['description'] = "CentOS-$releasever - RabbitMQ #{ver} - Testing"
default['yum']['centos-rabbitmq-testing']['enabled'] = false
default['yum']['centos-rabbitmq-testing']['make_cache'] = true
default['yum']['centos-rabbitmq-testing']['managed'] = false
default['yum']['centos-rabbitmq-testing']['gpgcheck'] = false
default['yum']['centos-rabbitmq-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/$releasever/messaging/$basearch/rabbitmq-#{ver}/"
# debuginfo
default['yum']['centos-rabbitmq-debuginfo']['repositoryid'] = 'centos-rabbitmq-debuginfo'
default['yum']['centos-rabbitmq-debuginfo']['description'] = "CentOS-$releasever - RabbitMQ #{ver} - Debuginfo"
default['yum']['centos-rabbitmq-debuginfo']['enabled'] = false
default['yum']['centos-rabbitmq-debuginfo']['make_cache'] = true
default['yum']['centos-rabbitmq-debuginfo']['managed'] = false
default['yum']['centos-rabbitmq-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/centos/$releasever/messaging/$basearch/'
default['yum']['centos-rabbitmq-debuginfo']['gpgkey'] =
  'https://git.centos.org/rpms/centos-release-messaging/raw/c8-sig-messaging/f/SOURCES/RPM-GPG-KEY-CentOS-SIG-Messaging'
