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
  when 6
    %w(base updates extras centosplus fasttrack debuginfo contrib)
  when 7
    %w(base updates extras centosplus fasttrack debuginfo cr)
  when 8
    %w(base appstream powertools extras centosplus fasttrack)
  end

repos.each do |repo|
  describe file("/etc/yum.repos.d/#{repo}.repo") do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end
