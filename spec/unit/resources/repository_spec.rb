# frozen_string_literal: true

require 'spec_helper'

describe 'yum_centos_repository' do
  step_into :yum_centos_repository

  context 'on centos-stream-9' do
    platform 'centos-stream', '9'

    recipe do
      yum_centos_repository 'baseos'
    end

    it 'creates the main repo with the stock metalink' do
      expect(chef_run).to create_yum_repository('baseos').with(
        metalink: 'https://mirrors.centos.org/metalink?repo=centos-baseos-$stream&arch=$basearch&protocol=https,http',
        gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial',
        enabled: true
      )
    end

    it 'creates the debug repo disabled by default' do
      expect(chef_run).to create_yum_repository('baseos-debuginfo').with(
        enabled: false
      )
    end

    it 'creates the source repo disabled by default' do
      expect(chef_run).to create_yum_repository('baseos-source').with(
        enabled: false
      )
    end
  end

  context 'on centos-stream-10 with overrides' do
    cached(:chef_run) do
      runner = ChefSpec::SoloRunner.new(step_into: %w(yum_centos_repository), platform: 'centos-stream', version: '9') do |node|
        node.automatic['platform_version'] = '10'
      end

      runner.converge_block do
        yum_centos_repository 'extras-common' do
          enabled false
          debug_enabled true
          options('priority' => '10')
        end
      end
    end

    it 'uses the extras SIG key for the main repo' do
      expect(chef_run).to create_yum_repository('extras-common').with(
        gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras-SHA512',
        enabled: false,
        options: { 'priority' => '10' }
      )
    end

    it 'enables the debug repo when requested' do
      expect(chef_run).to create_yum_repository('extras-common-debuginfo').with(
        enabled: true
      )
    end
  end

  context 'on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      yum_centos_repository 'baseos'
    end

    it 'converges without creating repositories' do
      expect { chef_run }.not_to raise_error
      expect(chef_run).not_to create_yum_repository('baseos')
    end
  end
end
