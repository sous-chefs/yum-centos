%w(
  AppStream
  Base
  centosplus
  CR
  Debuginfo
  Extras
  fasttrack
  HA
  Media
  PowerTools
  Sources
  Vault
  x86_64-kernel
).each do |name|
  describe file "/etc/yum.repos.d/CentOS-#{name}.repo" do
    it { should_not exist }
  end
end

os_release = os.release.to_i

describe yum.repo 'base' do
  it { should exist }
  it { should be_enabled }
  if os_release == 8
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{os_release}&arch=x86_64&repo=BaseOS" }
  else
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{os_release}&arch=x86_64&repo=os" }
  end
end

describe yum.repo 'extras' do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{os_release}&arch=x86_64&repo=extras" }
end

case os_release
when 7
  describe yum.repo 'updates' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{os_release}&arch=x86_64&repo=updates" }
  end
when 8
  describe yum.repo 'appstream' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp "http://mirrorlist.centos.org/?release=#{os_release}&arch=x86_64&repo=AppStream" }
  end
end

%w(centosplus fasttrack cr debuginfo).each do |repo|
  describe yum.repo repo do
    it { should_not exist }
    it { should_not be_enabled }
  end
end
