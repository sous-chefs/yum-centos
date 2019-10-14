default['yum-centos']['repos'] =
  value_for_platform(%w(centos redhat xenserver) =>
    {
      # TODO: Add debuginfo and cr repos for EL8 when repos are ready
      '>= 8.0' => %w(base appstream powertools extras centosplus fasttrack debuginfo),
      '~> 7.0' => %w(base updates extras centosplus fasttrack debuginfo cr),
      '< 7.0' => %w(base updates extras centosplus fasttrack debuginfo contrib),
    })

# NOTE: if set to false, repositories starting with CentOS-SCLo-* won't be deleted
default['yum-centos']['keep_scl_repositories'] = true
