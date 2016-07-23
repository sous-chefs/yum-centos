name 'yum-centos'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs and configures the centos Yum repositories'
version '0.4.12'

depends 'yum', '~> 3.10'

supports 'centos'

source_url 'https://github.com/chef-cookbooks/yum-centos' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/yum-centos/issues' if respond_to?(:issues_url)
