name 'yum-centos'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs and configures the centos Yum repositories'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.13'

depends 'yum', '>= 3.10', '< 5.0'

supports 'centos'

source_url 'https://github.com/chef-cookbooks/yum-centos'
issues_url 'https://github.com/chef-cookbooks/yum-centos/issues'

chef_version '>= 12'
