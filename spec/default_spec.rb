# Encoding: utf-8

require 'spec_helper'

describe 'yum-centos::default' do
  context 'yum-centos::default uses default attributes' do
    let(:chef_run) { ChefSpec::Runner.new(:step_into => ['yum_repository']).converge(described_recipe) }

    # Make sure base recipe removes default configurations. We will
    # recreate their contents over multiple files later.
    it 'deletes yum_repository[CentOS-Base]' do
      expect(chef_run).to delete_yum_repository('CentOS-Base')
    end

    # Make sure the yum_repository delete action works properly
    it 'steps into yum_repository and deletes file /etc/yum.repos.d/CentOS-Base.repo' do
      expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-Base.repo')
    end

    it 'deletes yum_repository[CentOS-Debuginfo]' do
      expect(chef_run).to delete_yum_repository('CentOS-Debuginfo')
    end

    it 'deletes yum_repository[CentOS-Media]' do
      expect(chef_run).to delete_yum_repository('CentOS-Media')
    end

    it 'deletes yum_repository[CentOS-Vault]' do
      expect(chef_run).to delete_yum_repository('CentOS-Vault')
    end

    it 'creates yum_repository[base]' do
      expect(chef_run).to create_yum_repository('base')
    end

    it 'creates yum_repository[updates]' do
      expect(chef_run).to create_yum_repository('updates')
    end

    it 'creates yum_repository[centos-extras]' do
      expect(chef_run).to create_yum_repository('extras')
    end

    it 'creates yum_repository[centosplus]' do
      expect(chef_run).to create_yum_repository('centosplus')
    end

    it 'creates yum_repository[contrib]' do
      expect(chef_run).to create_yum_repository('contrib')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/base.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/base.repo')
    end

    it 'steps into yum_repository and creates file template[/etc/yum.repos.d/updates.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates.repo')
    end

    it 'steps into yum_repository and creates file template[/etc/yum.repos.d/centosplus.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/centosplus.repo')
    end

    it 'steps into yum_repository and creates file template[/etc/yum.repos.d/contrib.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/contrib.repo')
    end

  end
end
