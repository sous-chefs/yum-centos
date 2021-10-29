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
    '8.3.2011'
  when 7
    '7.8.2003'
  end

describe yum.repo "centos-vault-#{vault_release}-base" do
  it { should exist }
  it { should be_enabled }
  if os_release == 8
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/BaseOS/x86_64/os/" }
  else
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/os/x86_64/" }
  end
end

describe yum.repo "centos-vault-#{vault_release}-extras" do
  it { should exist }
  it { should be_enabled }
  if os_release == 8
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/extras/x86_64/os/" }
  else
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/extras/x86_64/" }
  end
end

case os_release
when 7
  describe yum.repo "centos-vault-#{vault_release}-updates" do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/updates/x86_64/" }
  end
when 8
  describe yum.repo "centos-vault-#{vault_release}-appstream" do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should cmp "http://vault.centos.org/#{vault_release}/AppStream/x86_64/os/" }
  end
end

%w(centosplus fasttrack contrib cr debuginfo).each do |repo|
  describe yum.repo "centos-vault-#{vault_release}-#{repo}" do
    it { should_not exist }
    it { should_not be_enabled }
  end
end
