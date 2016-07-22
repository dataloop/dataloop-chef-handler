name             'dataloop-chef-handler'
maintainer       'Dataloop Software Inc.'
maintainer_email 'tom.ashley@dataloop.io'
license          'Apache 2.0'
source_url       'https://github.com/dataloop/dataloop-chef-handler/'
issues_url       'https://github.com/dataloop/dataloop-chef-handler/issues'
description      'Installs a chef handler to annotate Dataloop dashboards'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends 'chef_handler'
