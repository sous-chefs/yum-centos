module YumCentos
  module Cookbook
    module Helpers
      def release_var
        if yum_centos_stream?
          '$stream'
        else
          '$releasever'
        end
      end

      def centos_description
        if yum_centos_stream?
          'CentOS Stream $releasever'
        else
          'CentOS $releasever'
        end
      end

      def centos_8_repos
        if yum_centos_stream?
          %w(
            base
            appstream
            powertools
            extras
            centosplus
            fasttrack
            debuginfo
            highavailability
            realtime
            resilientstorage
            centos-advanced-virtualization
            centos-advanced-virtualization-testing
            centos-advanced-virtualization-debuginfo
            centos-ansible
            centos-ansible-testing
            centos-ansible-debuginfo
            centos-ceph
            centos-ceph-testing
            centos-gluster
            centos-gluster-testing
            centos-hyperscale
            centos-hyperscale-experimental
            centos-hyperscale-hotfixes
            centos-hyperscale-spin
            centos-nfs-ganesha
            centos-nfs-ganesha-testing
            centos-nfv-extras
            centos-nfv-extras-testing
            centos-nfv-extras-debuginfo
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
            centos-samba
            centos-samba-testing
          )
        else
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
            centos-advanced-virtualization
            centos-advanced-virtualization-testing
            centos-advanced-virtualization-debuginfo
            centos-ansible
            centos-ansible-testing
            centos-ansible-debuginfo
            centos-ceph
            centos-ceph-testing
            centos-gluster
            centos-gluster-testing
            centos-nfs-ganesha
            centos-nfs-ganesha-testing
            centos-nfv-extras
            centos-nfv-extras-testing
            centos-nfv-extras-debuginfo
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
            centos-samba
            centos-samba-testing
          )
        end
      end

      def centos_openstack_version
        if yum_centos_stream?
          'xena'
        else
          'victoria'
        end
      end

      def centos_vault_version
        if yum_centos_stream?
          "#{node['platform_version'].to_i}-stream"
        else
          '8.3.2011'
        end
      end

      private

      def yum_centos_stream?
        respond_to?(:centos_stream_platform?) && centos_stream_platform?
      end
    end
  end
end
# Needed to used in attributes/
Chef::Node.include ::YumCentos::Cookbook::Helpers
