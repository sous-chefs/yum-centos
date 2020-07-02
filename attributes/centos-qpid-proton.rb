# centos-release-qpid-proton : CentOS 8 Only
default['yum']['centos-qpid-proton']['repositoryid'] = 'centos-qpid-proton'
default['yum']['centos-qpid-proton']['description'] = 'CentOS-$releasever - QPID Proton'
default['yum']['centos-qpid-proton']['enabled'] = false
default['yum']['centos-qpid-proton']['make_cache'] = true
default['yum']['centos-qpid-proton']['managed'] = false
default['yum']['centos-qpid-proton']['mirrorlist'] =
  'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=messaging-qpid-proton'
# The Messaging SIG is currently in planning/onboarding so the key only exists in the release package or the git repo
# https://wiki.centos.org/SpecialInterestGroup/Messaging
default['yum']['centos-qpid-proton']['gpgkey'] =
  'https://git.centos.org/rpms/centos-release-messaging/raw/c8-sig-messaging/f/SOURCES/RPM-GPG-KEY-CentOS-SIG-Messaging'
# testing
default['yum']['centos-qpid-proton-testing']['repositoryid'] = 'centos-qpid-proton-testing'
default['yum']['centos-qpid-proton-testing']['description'] = 'CentOS-$releasever - QPID Proton - Testing'
default['yum']['centos-qpid-proton-testing']['enabled'] = false
default['yum']['centos-qpid-proton-testing']['make_cache'] = true
default['yum']['centos-qpid-proton-testing']['managed'] = false
default['yum']['centos-qpid-proton-testing']['gpgcheck'] = false
default['yum']['centos-qpid-proton-testing']['baseurl'] =
  'https://buildlogs.centos.org/centos/$releasever/messaging/$basearch/qpid-proton'
# debuginfo
default['yum']['centos-qpid-proton-debuginfo']['repositoryid'] = 'centos-qpid-proton-debuginfo'
default['yum']['centos-qpid-proton-debuginfo']['description'] = 'CentOS-$releasever - QPID Proton - Debuginfo'
default['yum']['centos-qpid-proton-debuginfo']['enabled'] = false
default['yum']['centos-qpid-proton-debuginfo']['make_cache'] = true
default['yum']['centos-qpid-proton-debuginfo']['managed'] = false
default['yum']['centos-qpid-proton-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/centos/$releasever/messaging/$basearch/'
default['yum']['centos-qpid-proton-debuginfo']['gpgkey'] =
  'https://git.centos.org/rpms/centos-release-messaging/raw/c8-sig-messaging/f/SOURCES/RPM-GPG-KEY-CentOS-SIG-Messaging'
