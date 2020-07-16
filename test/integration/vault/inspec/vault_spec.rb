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
vault_release =
  case os.release.to_i
  when 8
    '8.0.1905'
  when 7
    '7.7.1908'
  when 6
    '6.9'
  end

describe yum.repo 'base' do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp nil }
  if os_release == 8
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/BaseOS/x86_64/os/" }
  else
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/os/x86_64/" }
  end
end

describe yum.repo 'extras' do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp nil }
  if os_release == 8
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/extras/x86_64/os/" }
  else
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/extras/x86_64/" }
  end
end

case os_release
when 6, 7
  describe yum.repo 'updates' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp nil }
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/updates/x86_64/" }
  end
when 8
  describe yum.repo 'appstream' do
    it { should exist }
    it { should be_enabled }
    its('mirrors') { should cmp nil }
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/AppStream/x86_64/os/" }
  end
end

%w(centosplus fasttrack contrib cr debuginfo).each do |repo|
  describe yum.repo repo do
    it { should_not exist }
    it { should_not be_enabled }
  end
end
