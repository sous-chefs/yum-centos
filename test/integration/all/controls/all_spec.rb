# frozen_string_literal: true

arch = os.arch
supported_optional_repo_ids =
  if arch == 'aarch64'
    %w(crb highavailability rt)
  else
    %w(crb highavailability nfv rt resilientstorage)
  end
unsupported_optional_repo_ids =
  if arch == 'aarch64'
    %w(nfv resilientstorage)
  else
    []
  end
expected_repo_ids = %w(baseos appstream extras-common) + supported_optional_repo_ids

control 'yum-centos-all-repos-01' do
  impact 1.0
  title 'All repos supported on the current architecture are enabled when requested'

  expected_repo_ids.each do |repo_id|
    describe yum.repo repo_id do
      it { should exist }
      it { should be_enabled }
    end
  end
end

control 'yum-centos-all-repos-02' do
  impact 0.7
  title 'Debug and source repos remain disabled by default for managed repos'

  expected_repo_ids.each do |repo_id|
    describe yum.repo "#{repo_id}-debuginfo" do
      it { should exist }
      it { should_not be_enabled }
    end

    describe yum.repo "#{repo_id}-source" do
      it { should exist }
      it { should_not be_enabled }
    end
  end
end

control 'yum-centos-all-repos-03' do
  impact 0.5
  title 'Repos without published metadata on this architecture are skipped'
  only_if('This control only applies to architectures with missing optional CentOS mirrors') do
    unsupported_optional_repo_ids.any?
  end

  unsupported_optional_repo_ids.each do |repo_id|
    describe yum.repo repo_id do
      it { should_not exist }
    end
  end
end
