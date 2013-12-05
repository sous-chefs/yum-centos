# Encoding: utf-8

default['yum']['centosplus']['repositoryid'] = 'centosplus'
default['yum']['centosplus']['description'] = 'CentOS-$releasever - Centosplus'
default['yum']['centosplus']['mirrorlist'] = 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus'
default['yum']['centosplus']['enabled'] = false
default['yum']['centosplus']['gpgcheck'] = true
default['yum']['centosplus']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
