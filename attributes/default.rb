contrib = value_for_platform(%w(centos redhat xenserver) => {
                               '>= 7.0' => 'cr',
                               :default => 'contrib',
                             })

default['yum-centos']['repos'] = %W(
  base
  updates
  extras
  centosplus
  fasttrack
  #{contrib}
)

# NOTE: if set to false, repositories starting with CentOS-SCLo-* won't be deleted
default['yum-centos']['keep_scl_repositories'] = true
