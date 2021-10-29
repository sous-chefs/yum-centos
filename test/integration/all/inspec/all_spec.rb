# TODO: convert from file to yum.repo InSpec resources
# https://github.com/inspec/inspec/pull/4568

%w(
  ANSIBLE
  AppStream
  Azure
  Base
  centosplus
  Ceph-Nautilus
  Ceph-Octopus
  CR
  Debuginfo
  DotNet
  Extras
  fasttrack
  fdio
  Gluster-7
  HA
  Media
  Messaging-qpid-proton
  Messaging-rabbitmq
  NFS-Ganesha-28
  NFS-Ganesha-3
  NFS-Ganesha-30
  nfv-common
  OpenShift-Origin
  OpenShift-Origin311
  OpenStack-train
  OpenStack-victoria
  OpenStack-xena
  OpsTools
  oVirt-4.3
  PowerTools
  QEMU-EV
  SCLo-scl
  SCLo-scl-rh
  SIG-ansible-29
  Sources
  Storage-common
  Vault
  Xen
  Xen-412
  Xen-dependencies
).each do |name|
  describe file "/etc/yum.repos.d/CentOS-#{name}.repo" do
    it { should_not exist }
  end
end

os_release = os.release.to_i
stream = file('/etc/os-release').content.match?('Stream')
rel = stream ? "#{os_release}-stream" : os_release

describe yum.repo 'base' do
  it { should exist }
  it { should be_enabled }
  if os_release == 8
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=BaseOS" }
  else
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=os" }
  end
end

describe yum.repo 'extras' do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=extras" }
end

describe yum.repo 'cr' do
  if stream
    it { should_not exist }
    it { should_not be_enabled }
  else
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=cr" }
  end
end

describe yum.repo 'debuginfo' do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should cmp "http://debuginfo.centos.org/#{rel}/x86_64/" }
end

describe yum.repo 'centos-gluster' do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=storage-gluster-9" }
end

describe yum.repo 'centos-gluster-testing' do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should cmp "https://buildlogs.centos.org/centos/#{rel}/storage/x86_64/gluster-9/" }
end

case os_release
when 7
  describe yum.repo 'updates' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=updates' }
  end

  describe yum.repo 'centos-kernel' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=kernel' }
  end

  describe yum.repo 'centos-ansible' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=configmanagement-ansible-29'
    end
  end

  describe yum.repo 'centos-ansible-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://buildlogs.centos.org/centos/7/configmanagement/x86_64/ansible-29/'
    end
  end

  describe yum.repo 'centos-ansible-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://debuginfo.centos.org/centos/7/configmanagement/x86_64/'
    end
  end

  describe yum.repo 'centos-azure' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=virt-azure' }
  end

  describe yum.repo 'centos-azure-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/virt/x86_64/azure/' }
  end

  describe yum.repo 'centos-ceph' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=storage-ceph-nautilus'
    end
  end

  describe yum.repo 'centos-ceph-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'https://buildlogs.centos.org/centos/7/storage/x86_64/ceph-nautilus/'
    end
  end

  describe yum.repo 'centos-dotnet' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=dotnet' }
  end

  describe yum.repo 'centos-fdio' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=nfv-fdio' }
  end

  describe yum.repo 'centos-fdio-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/nfv/x86_64/fdio/' }
  end

  describe yum.repo 'centos-nfs-ganesha' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=storage-nfsganesha-30'
    end
  end

  describe yum.repo 'centos-nfs-ganesha-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'https://buildlogs.centos.org/centos/7/storage/x86_64/nfsganesha-30/'
    end
  end

  describe yum.repo 'centos-nfv-common' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=nfv-common'
    end
  end

  describe yum.repo 'centos-nfv-common-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'https://buildlogs.centos.org/centos/7/nfv/x86_64/nfv-common/'
    end
  end

  describe yum.repo 'centos-openshift-origin' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=paas-openshift-origin311'
    end
  end

  describe yum.repo 'centos-openshift-origin-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'https://buildlogs.centos.org/centos/7/paas/x86_64/openshift-origin311/'
    end
  end

  describe yum.repo 'centos-openshift-origin-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://debuginfo.centos.org/centos/7/paas/x86_64/'
    end
  end

  describe yum.repo 'centos-openstack' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=cloud-openstack-train'
    end
  end

  describe yum.repo 'centos-openstack-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'https://buildlogs.centos.org/centos/7/cloud/x86_64/openstack-train/'
    end
  end

  describe yum.repo 'centos-openstack-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://debuginfo.centos.org/centos/7/cloud/x86_64/'
    end
  end

  describe yum.repo 'centos-opstools' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=opstools' }
  end

  describe yum.repo 'centos-opstools-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/opstools/x86_64/' }
  end

  describe yum.repo 'centos-ovirt' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=virt-ovirt-4.3' }
  end

  describe yum.repo 'centos-ovirt-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/virt/x86_64/ovirt-4.3/' }
  end

  describe yum.repo 'centos-ovirt-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'http://debuginfo.centos.org/centos/7/virt/x86_64/' }
  end

  describe yum.repo 'centos-qemu-ev' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=virt-kvm-common' }
  end

  describe yum.repo 'centos-qemu-ev-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/virt/x86_64/kvm-common/' }
  end

  describe yum.repo 'centos-sclo' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=sclo-sclo' }
  end

  describe yum.repo 'centos-sclo-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/sclo/x86_64/sclo/' }
  end

  describe yum.repo 'centos-sclo-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'http://debuginfo.centos.org/centos/7/sclo/x86_64/' }
  end

  describe yum.repo 'centos-sclo-rh' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=sclo-rh' }
  end

  describe yum.repo 'centos-sclo-rh-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/sclo/x86_64/rh/' }
  end

  describe yum.repo 'centos-sclo-rh-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'http://debuginfo.centos.org/centos/7/sclo/x86_64/' }
  end

  describe yum.repo 'centos-virt-xen' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp 'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=virt-xen-412' }
  end

  describe yum.repo 'centos-virt-xen-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/7/virt/x86_64/xen-412/' }
  end
when 8
  if stream
    describe yum.repo 'realtime' do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp 'http://mirrorlist.centos.org/?release=8-stream&arch=x86_64&repo=RT'
      end
    end

    describe yum.repo 'resilientstorage' do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp 'http://mirrorlist.centos.org/?release=8-stream&arch=x86_64&repo=ResilientStorage'
      end
    end

    describe yum.repo 'centos-hyperscale' do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp 'http://mirrorlist.centos.org/?release=8-stream&arch=x86_64&repo=hyperscale-packages-main'
      end
    end

    describe yum.repo 'centos-hyperscale-experimental' do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp 'http://mirrorlist.centos.org/?release=8-stream&arch=x86_64&repo=hyperscale-packages-experimental'
      end
    end

    describe yum.repo 'centos-hyperscale-hotfixes' do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp 'http://mirrorlist.centos.org/?release=8-stream&arch=x86_64&repo=hyperscale-packages-hotfixes'
      end
    end

    describe yum.repo 'centos-hyperscale-spin' do
      it { should exist }
      it { should be_enabled }
      its('mirrors') do
        should cmp 'http://mirrorlist.centos.org/?release=8-stream&arch=x86_64&repo=hyperscale-packages-spin'
      end
    end
  end
  describe yum.repo 'centos-ansible' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=configmanagement-ansible-29'
    end
  end

  describe yum.repo 'centos-ansible-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://buildlogs.centos.org/centos/8/configmanagement/x86_64/ansible-29/'
    end
  end

  describe yum.repo 'centos-ansible-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://debuginfo.centos.org/centos/8/configmanagement/x86_64/'
    end
  end

  describe yum.repo 'appstream' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=AppStream"
    end
  end

  describe yum.repo 'centos-ceph' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=storage-ceph-pacific"
    end
  end

  describe yum.repo 'centos-ceph-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "https://buildlogs.centos.org/centos/#{rel}/storage/x86_64/ceph-pacific/"
    end
  end

  describe yum.repo 'highavailability' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=HighAvailability"
    end
  end

  describe yum.repo 'centos-nfs-ganesha' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=storage-nfsganesha-3"
    end
  end

  describe yum.repo 'centos-nfs-ganesha-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "https://buildlogs.centos.org/centos/#{rel}/storage/x86_64/nfsganesha-3/"
    end
  end

  describe yum.repo 'centos-nfv-extras' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=nfv-network-extras"
    end
  end

  describe yum.repo 'centos-nfv-extras-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "http://buildlogs.centos.org/centos/#{rel}/nfv/x86_64/network-extras/"
    end
  end

  describe yum.repo 'centos-nfv-extras-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "http://debuginfo.centos.org/centos/#{rel}/nfv/x86_64/"
    end
  end

  describe yum.repo 'centos-openstack' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      if stream
        should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=cloud-openstack-xena"
      else
        should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=cloud-openstack-victoria"
      end
    end
  end

  describe yum.repo 'centos-openstack-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      if stream
        should cmp "https://buildlogs.centos.org/centos/#{rel}/cloud/x86_64/openstack-xena/"
      else
        should cmp "https://buildlogs.centos.org/centos/#{rel}/cloud/x86_64/openstack-victoria/"
      end
    end
  end

  describe yum.repo 'centos-openstack-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "http://debuginfo.centos.org/centos/#{rel}/cloud/x86_64/"
    end
  end

  describe yum.repo 'centos-opstools' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=opstools-collectd-5'
    end
  end

  describe yum.repo 'centos-opstools-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp 'https://buildlogs.centos.org/centos/8/opstools/x86_64/collectd-5' }
  end

  describe yum.repo 'centos-ovirt' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=virt-ovirt-4.4" }
  end

  describe yum.repo 'centos-ovirt-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp "https://buildlogs.centos.org/centos/#{rel}/virt/x86_64/ovirt-4.4/" }
  end

  describe yum.repo 'centos-ovirt-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp "http://debuginfo.centos.org/centos/#{rel}/virt/x86_64/" }
  end

  describe yum.repo 'centos-qpid-proton' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp 'http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=messaging-qpid-proton'
    end
  end

  describe yum.repo 'centos-qpid-proton-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'https://buildlogs.centos.org/centos/8/messaging/x86_64/qpid-proton'
    end
  end

  describe yum.repo 'centos-qpid-proton-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp 'http://debuginfo.centos.org/centos/8/messaging/x86_64/'
    end
  end

  describe yum.repo 'centos-rabbitmq' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=messaging-rabbitmq-38"
    end
  end

  describe yum.repo 'centos-rabbitmq-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "https://buildlogs.centos.org/centos/#{rel}/messaging/x86_64/rabbitmq-38/"
    end
  end

  describe yum.repo 'centos-rabbitmq-debuginfo' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "http://debuginfo.centos.org/centos/#{rel}/messaging/x86_64/"
    end
  end

  describe yum.repo 'centos-samba' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') do
      should cmp "http://mirrorlist.centos.org/?release=#{rel}&arch=x86_64&repo=storage-samba-415"
    end
  end

  describe yum.repo 'centos-samba-testing' do
    it { should exist }
    it { should be_enabled }
    its('baseurl') do
      should cmp "https://buildlogs.centos.org/centos/#{rel}/storage/x86_64/samba-415/"
    end
  end

end
