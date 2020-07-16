default['yum-centos']['repos'] =
  value_for_platform(%w(centos redhat xenserver) =>
    {
      # NOTE: Ensure primary OS repos are listed first
      '>= 8.0' =>
        %w(
          base
          appstream
          powertools
          extras
          centosplus
          fasttrack
          debuginfo
          cr
          highavailability
          centos-ansible
          centos-ansible-testing
          centos-ansible-debuginfo
          centos-ceph
          centos-ceph-testing
          centos-gluster
          centos-gluster-testing
          centos-nfs-ganesha
          centos-nfs-ganesha-testing
          centos-openstack
          centos-openstack-testing
          centos-openstack-debuginfo
          centos-opstools
          centos-opstools-testing
          centos-qpid-proton
          centos-qpid-proton-testing
          centos-qpid-proton-debuginfo
          centos-rabbitmq
          centos-rabbitmq-testing
          centos-rabbitmq-debuginfo
        ),
      '~> 7.0' =>
        %w(
          base
          updates
          extras
          centosplus
          fasttrack
          debuginfo
          cr
          centos-kernel
          centos-ansible
          centos-ansible-testing
          centos-ansible-debuginfo
          centos-azure
          centos-azure-testing
          centos-ceph
          centos-ceph-testing
          centos-dotnet
          centos-fdio
          centos-fdio-testing
          centos-nfv-common
          centos-nfv-common-testing
          centos-gluster
          centos-gluster-testing
          centos-nfs-ganesha
          centos-nfs-ganesha-testing
          centos-openshift-origin
          centos-openshift-origin-testing
          centos-openshift-origin-debuginfo
          centos-openstack
          centos-openstack-testing
          centos-openstack-debuginfo
          centos-opstools
          centos-opstools-testing
          centos-ovirt
          centos-ovirt-testing
          centos-ovirt-debuginfo
          centos-qemu-ev
          centos-qemu-ev-testing
          centos-sclo
          centos-sclo-testing
          centos-sclo-debuginfo
          centos-sclo-rh
          centos-sclo-rh-testing
          centos-sclo-rh-debuginfo
          centos-virt-xen
          centos-virt-xen-testing
        ),
      '< 7.0' =>
        %w(
          base
          updates
          extras
          centosplus
          fasttrack
          debuginfo
          cr
          contrib
          centos-azure
          centos-azure-testing
          centos-gluster
          centos-gluster-testing
          centos-sclo
          centos-sclo-testing
          centos-sclo-debuginfo
          centos-sclo-rh
          centos-sclo-rh-testing
          centos-sclo-rh-debuginfo
          centos-virt-xen
          centos-virt-xen-testing
        ),
    })
# Vault only provides binary packages for the previous release
default['yum-centos']['vault_release'] =
  value_for_platform(%w(centos redhat xenserver) =>
  {
      '>= 8.0' => '8.0.1905',
      '~> 7.0' => '7.7.1908',
      '< 7.0' => '6.9',
  })

# SIG repo versions
default['yum-centos']['ansible_version'] = '29'
default['yum-centos']['ceph_version'] =
  value_for_platform(%w(centos redhat xenserver) =>
  {
      '>= 8.0' => 'octopus',
      '~> 7.0' => 'nautilus',
      '< 7.0' => '',
  })
default['yum-centos']['gluster_version'] = '7'
default['yum-centos']['nfs_ganesha_version'] =
  value_for_platform(%w(centos redhat xenserver) =>
  {
      '>= 8.0' => '3',
      '~> 7.0' => '30',
  })
default['yum-centos']['openshift_version'] = '311'
default['yum-centos']['openstack_version'] =
  value_for_platform(%w(centos redhat xenserver) =>
  {
      '>= 8.0' => 'ussuri',
      '~> 7.0' => 'train',
      '< 7.0' => '',
  })
default['yum-centos']['opstools_version'] =
  value_for_platform(%w(centos redhat xenserver) =>
  {
      '>= 8.0' => '-collectd-5',
      '< 8.0' => '',
  })
default['yum-centos']['ovirt_version'] = '4.3'
default['yum-centos']['rabbitmq_version'] = '38'
default['yum-centos']['virt_xen_version'] =
  value_for_platform(%w(centos redhat xenserver) =>
  {
      '~> 7.0' => '412',
      '< 7.0' => '410',
  })
