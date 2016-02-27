default['yum-centos']['repos'] = %w(base updates extras centosplus fasttrack) << value_for_platform(%w(centos redhat) => {
                                                                                                      '>= 7.0' => 'cr',
                                                                                                      :default => 'contrib'
                                                                                                    })
