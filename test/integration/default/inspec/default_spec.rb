# SCL does not exist in CentOS 8
if os.release.to_i < 8
  describe command('yum install -y centos-release-scl-rh centos-release-scl') do
    its('exit_status') { should eq 0 }
  end

  %w(CentOS-SCLo-scl.repo CentOS-SCLo-scl-rh.repo).each do |scl_repo|
    describe file "/etc/yum.repos.d/#{scl_repo}" do
      it { should exist }
    end
  end
end

# TODO: convert from file to yum.repo InSpec resources
# https://github.com/inspec/inspec/pull/4568

%w(
  AppStream
  Base
  centosplus
  CR
  Debuginfo
  Extras
  fasttrack
  Media
  PowerTools
  Sources
  Vault
).each do |name|
  describe file "/etc/yum.repos.d/CentOS-#{name}.repo" do
    it { should_not exist }
  end
end

repos =
  case os.release.to_i
  when 6, 7
    %w(base updates extras)
  when 8
    %w(base appstream extras)
  end

repos.each do |repo|
  describe file("/etc/yum.repos.d/#{repo}.repo") do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end
%w(centosplus fasttrack contrib cr debuginfo).each do |repo|
  describe file("/etc/yum.repos.d/#{repo}.repo") do
    it { should_not exist }
  end
end
