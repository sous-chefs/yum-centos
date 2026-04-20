# frozen_string_literal: true

name              'yum-centos'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs and configures the CentOS Stream Yum repositories'
version           '5.2.12'
source_url        'https://github.com/sous-chefs/yum-centos'
issues_url        'https://github.com/sous-chefs/yum-centos/issues'
chef_version      '>= 16.10'

supports 'centos', '>= 9.0'
