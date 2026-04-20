# frozen_string_literal: true

module YumCentos
  module Cookbook
    module Helpers
      REPO_CATALOG = {
        'appstream' => {
          label: 'AppStream',
          slug: 'appstream',
          default_enabled: true,
          gpgkey_type: :official,
        },
        'baseos' => {
          label: 'BaseOS',
          slug: 'baseos',
          default_enabled: true,
          gpgkey_type: :official,
        },
        'crb' => {
          label: 'CRB',
          slug: 'crb',
          default_enabled: false,
          gpgkey_type: :official,
        },
        'extras-common' => {
          label: 'Extras packages',
          slug: 'extras-sig-extras-common',
          default_enabled: true,
          gpgkey_type: :extras,
        },
        'highavailability' => {
          label: 'HighAvailability',
          slug: 'highavailability',
          default_enabled: false,
          gpgkey_type: :official,
        },
        'nfv' => {
          label: 'NFV',
          slug: 'nfv',
          default_enabled: false,
          gpgkey_type: :official,
        },
        'resilientstorage' => {
          label: 'ResilientStorage',
          slug: 'resilientstorage',
          default_enabled: false,
          gpgkey_type: :official,
        },
        'rt' => {
          label: 'RT',
          slug: 'rt',
          default_enabled: false,
          gpgkey_type: :official,
        },
      }.freeze

      DEFAULT_REPO_IDS = REPO_CATALOG.filter_map do |repo_id, definition|
        repo_id if definition[:default_enabled]
      end.freeze

      VENDOR_REPO_PATHS = %w(
        /etc/yum.repos.d/centos.repo
        /etc/yum.repos.d/centos-addons.repo
      ).freeze

      def centos_stream_platform?
        node['platform'] == 'centos' && node['platform_version'].to_i >= 9
      end

      def centos_supported_repo_ids
        REPO_CATALOG.keys
      end

      def centos_default_repo_ids
        DEFAULT_REPO_IDS
      end

      def centos_vendor_repo_paths
        VENDOR_REPO_PATHS
      end

      def centos_repo_definition(repo_id, variant: :main)
        raise ArgumentError, "Unsupported yum-centos repo id #{repo_id}" unless REPO_CATALOG.key?(repo_id)

        definition = REPO_CATALOG[repo_id]
        variant_suffix =
          case variant
          when :debug
            ' - Debug'
          when :source
            ' - Source'
          else
            ''
          end

        slug_suffix =
          case variant
          when :debug
            '-debug'
          when :source
            '-source'
          else
            ''
          end

        arch = variant == :source ? 'source' : '$basearch'

        {
          repositoryid: centos_repo_identifier(repo_id, variant),
          description: "CentOS Stream $releasever - #{definition[:label]}#{variant_suffix}",
          metalink: "https://mirrors.centos.org/metalink?repo=centos-#{definition[:slug]}#{slug_suffix}-$stream&arch=#{arch}&protocol=https,http",
          gpgkey: centos_repo_gpgkey(definition[:gpgkey_type]),
          gpgcheck: true,
          repo_gpgcheck: false,
          metadata_expire: '6h',
          enabled: variant == :main ? definition[:default_enabled] : false,
        }
      end

      def centos_repo_identifier(repo_id, variant)
        case variant
        when :debug
          "#{repo_id}-debuginfo"
        when :source
          "#{repo_id}-source"
        else
          repo_id
        end
      end

      private

      def centos_repo_gpgkey(gpgkey_type)
        case gpgkey_type
        when :extras
          'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras-SHA512'
        when :official
          if node['platform_version'].to_i >= 10
            'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256'
          else
            'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
          end
        else
          raise ArgumentError, "Unsupported gpgkey type #{gpgkey_type}"
        end
      end
    end
  end
end
