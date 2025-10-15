default['yum-centos']['repos'] =
  value_for_platform(%w(centos redhat) =>
    {
      # NOTE: Ensure primary OS repos are listed first
      '>= 8.0' => centos_8_repos,
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
          centos-samba
          centos-samba-testing
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
default_vault_settings = {
  'enabled' => true,
  'managed' => true,
  'make_cache' => true,
}

# Vault only provides binary packages for the previous release
default['yum-centos']['vault_repos'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => { '8.3.2011' => default_vault_settings },
    '~> 7.0' => { '7.8.2003' => default_vault_settings },
  })

# SIG repo versions
default['yum-centos']['ansible_version'] = '29'
default['yum-centos']['ceph_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => 'pacific',
    '~> 7.0' => 'nautilus',
  })
default['yum-centos']['gluster_version'] = '9'
default['yum-centos']['nfs_ganesha_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => '3',
    '~> 7.0' => '30',
  })
default['yum-centos']['openshift_version'] = '311'
default['yum-centos']['openstack_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => centos_openstack_version,
    '~> 7.0' => 'train',
  })
default['yum-centos']['opstools_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => '-collectd-5',
    '< 8.0' => '',
  })
default['yum-centos']['ovirt_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => '44',
    '~> 7.0' => '4.4',
  })
default['yum-centos']['rabbitmq_version'] = '38'
default['yum-centos']['samba_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '>= 8.0' => '415',
    '~> 7.0' => '411',
  })
default['yum-centos']['virt_xen_version'] =
  value_for_platform(%w(centos redhat) =>
  {
    '~> 7.0' => '414',
  })
