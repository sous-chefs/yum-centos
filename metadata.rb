name             'yum-centos'
maintainer       'Chef'
maintainer_email 'Sean OMeara <someara@opscode.com>'
license          'Apache 2.0'
description      'Installs/Configures yum-centos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'yum'
