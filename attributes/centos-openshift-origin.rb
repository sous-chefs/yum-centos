# centos-release-openshift-origin311 : CentOS 7 only
ver = node['yum-centos']['openshift_version']

default['yum']['centos-openshift-origin']['repositoryid'] = 'centos-openshift-origin'
default['yum']['centos-openshift-origin']['description'] = "CentOS-$releasever - OpenShift Origin #{ver}"
default['yum']['centos-openshift-origin']['enabled'] = false
default['yum']['centos-openshift-origin']['make_cache'] = true
default['yum']['centos-openshift-origin']['managed'] = false
default['yum']['centos-openshift-origin']['mirrorlist'] =
  "http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=paas-openshift-origin#{ver}"
default['yum']['centos-openshift-origin']['gpgkey'] = 'https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-PaaS'
# testing
default['yum']['centos-openshift-origin-testing']['repositoryid'] = 'centos-openshift-origin-testing'
default['yum']['centos-openshift-origin-testing']['description'] =
  "CentOS-$releasever - OpenShift Origin #{ver} - Testing"
default['yum']['centos-openshift-origin-testing']['enabled'] = false
default['yum']['centos-openshift-origin-testing']['make_cache'] = true
default['yum']['centos-openshift-origin-testing']['managed'] = false
default['yum']['centos-openshift-origin-testing']['gpgcheck'] = false
default['yum']['centos-openshift-origin-testing']['baseurl'] =
  "https://buildlogs.centos.org/centos/$releasever/paas/$basearch/openshift-origin#{ver}/"
# debuginfo
default['yum']['centos-openshift-origin-debuginfo']['repositoryid'] = 'centos-openshift-origin-debuginfo'
default['yum']['centos-openshift-origin-debuginfo']['description'] =
  "CentOS-$releasever - OpenShift Origin #{ver} - DebugInfo"
default['yum']['centos-openshift-origin-debuginfo']['enabled'] = false
default['yum']['centos-openshift-origin-debuginfo']['make_cache'] = true
default['yum']['centos-openshift-origin-debuginfo']['managed'] = false
default['yum']['centos-openshift-origin-debuginfo']['baseurl'] =
  'http://debuginfo.centos.org/centos/$releasever/paas/$basearch/'
