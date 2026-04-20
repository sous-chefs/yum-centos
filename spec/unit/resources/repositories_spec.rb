# frozen_string_literal: true

require 'spec_helper'

describe 'yum_centos_repositories' do
  step_into %i(yum_centos_repositories yum_centos_repository)

  context 'with defaults on centos-stream-9' do
    platform 'centos-stream', '9'

    recipe do
      yum_centos_repositories 'default'
    end

    it 'purges the stock vendor repo files' do
      expect(chef_run).to delete_file('/etc/yum.repos.d/centos.repo')
      expect(chef_run).to delete_file('/etc/yum.repos.d/centos-addons.repo')
    end

    it 'creates the default enabled repos' do
      %w(baseos appstream extras-common).each do |repo_id|
        expect(chef_run).to create_yum_repository(repo_id)
      end
    end

    it 'does not create optional repos unless requested' do
      %w(crb highavailability nfv rt resilientstorage).each do |repo_id|
        expect(chef_run).not_to create_yum_repository(repo_id)
      end
    end
  end

  context 'with explicit repo overrides on centos-stream-10' do
    cached(:chef_run) do
      runner = ChefSpec::SoloRunner.new(step_into: %w(yum_centos_repositories yum_centos_repository), platform: 'centos-stream', version: '9') do |node|
        node.automatic['platform_version'] = '10'
      end

      runner.converge_block do
        yum_centos_repositories 'all' do
          repo_ids %w(baseos appstream extras-common crb highavailability nfv rt resilientstorage)
          repo_overrides(
            'crb' => { 'enabled' => true },
            'highavailability' => { 'enabled' => true },
            'nfv' => { 'enabled' => true },
            'rt' => { 'enabled' => true },
            'resilientstorage' => { 'enabled' => true }
          )
        end
      end
    end

    it 'creates all requested repos with overrides applied' do
      %w(crb highavailability nfv rt resilientstorage).each do |repo_id|
        expect(chef_run).to create_yum_repository(repo_id).with(enabled: true)
      end
    end
  end

  context 'with enable_repo_ids on centos-stream-9' do
    platform 'centos-stream', '9'

    recipe do
      yum_centos_repositories 'default-plus-optionals' do
        enable_repo_ids %w(highavailability realtime)
      end
    end

    it 'keeps the default repo set and enables the requested optional repos' do
      %w(baseos appstream extras-common).each do |repo_id|
        expect(chef_run).to create_yum_repository(repo_id)
      end

      expect(chef_run).to create_yum_repository('highavailability').with(enabled: true)
      expect(chef_run).to create_yum_repository('rt').with(enabled: true)
    end
  end

  context 'on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      yum_centos_repositories 'default'
    end

    it 'converges successfully without changing yum repos' do
      expect { chef_run }.not_to raise_error
      expect(chef_run).not_to delete_file('/etc/yum.repos.d/centos.repo')
    end
  end
end
