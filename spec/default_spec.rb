require 'spec_helper'

describe 'yum-centos::default' do
  context 'yum-centos::default uses default attributes' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['yum']['base']['managed'] = true
        node.set['yum']['updates']['managed'] = true
        node.set['yum']['extras']['managed'] = true
        node.set['yum']['centosplus']['managed'] = true
        node.set['yum']['contrib']['managed'] = true
        node.set['yum']['fasttrack']['managed'] = true
      end.converge('yum-centos::default')
    end

    context 'removing stock configuration files' do
      it 'deletes file[/etc/yum.repos.d/CentOS-Base.repo]' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-Base.repo')
      end

      it 'deletes file[/etc/yum.repos.d/CentOS-Debuginfo.repo]' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-Debuginfo.repo')
      end

      it 'deletes file[/etc/yum.repos.d/CentOS-Media.repo]' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-Media.repo')
      end

      it 'deletes yum_repository[CentOS-Vault.repo]' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-Vault.repo')
      end

      it 'deletes yum_repository[CentOS-fasttrack.repo]' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-fasttrack.repo')
      end
    end

    context 'rendering centos yum channel repositories' do
      %w(      base updates extras centosplus contrib fasttrack      ).each do |repo|
        it "creates yum_repository[#{repo}]" do
          expect(chef_run).to create_yum_repository(repo)
        end
      end
    end

  end
end
