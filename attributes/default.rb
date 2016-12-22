contrib = value_for_platform(%w(centos redhat) => {
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
