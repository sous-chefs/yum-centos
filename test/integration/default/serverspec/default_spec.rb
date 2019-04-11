require 'serverspec'

set :backend, :exec

puts "os: #{os}"

describe 'yum-centos::default' do
  command('yum install -y centos-release-scl-rh centos-release-scl')

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

  content 'keeping SCL repositories' do
    ['CentOS-SCLo-scl.repo', 'CentOS-SCLo-scl-rh.repo'].each do |scl_repo|
      describe file "/etc/yum.repos.d/#{scl_repo}" do
        it { should exist }
      end
    end
  end

  context 'veryfing centos yum channel repositories' do
    repos = %w(base updates extras)
    repos.each do |repo|
      describe file("/etc/yum.repos.d/#{repo}.repo") do
        it { should exist }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
    end
    %w(centosplus fasttrack contrib cr).each do |repo|
      describe file("/etc/yum.repos.d/#{repo}.repo") do
        it { should_not exist }
      end
    end
  end
end
