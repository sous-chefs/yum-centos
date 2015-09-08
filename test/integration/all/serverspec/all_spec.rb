require_relative '../../../kitchen/data/spec_helper'

describe 'yum-centos::default' do
  context 'deleting default yum channel repositories' do
    describe file '/etc/yum.repos.d/CentOS-Base.repo' do
      it { should_not exist }
    end
    describe file '/etc/yum.repos.d/CentOS-Debuginfo.repo' do
      it { should_not exist }
    end
    describe file '/etc/yum.repos.d/CentOS-Media.repo' do
      it { should_not exist }
    end
    describe file '/etc/yum.repos.d/CentOS-Vault.repo' do
      it { should_not exist }
    end
    describe file '/etc/yum.repos.d/CentOS-fasttrack.repo' do
      it { should_not exist }
    end
    describe file '/etc/yum.repos.d/CentOS-Sources.repo' do
      it { should_not exist }
    end
    describe file '/etc/yum.repos.d/CentOS-CR.repo' do
      it { should_not exist }
    end
  end

  context 'veryfing centos yum channel repositories' do
    repos = %w(base updates extras centosplus fasttrack)
    repos << case host_inventory['platform_version'][/(^\d+\.\d+)/]
             when '7.0'
               'cr'
             else
               'contrib'
             end
    repos.each do |repo|
      describe file("/etc/yum.repos.d/#{repo}.repo") do
        it { should exist }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
    end
  end
end
