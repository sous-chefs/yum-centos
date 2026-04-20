# frozen_string_literal: true

control 'yum-centos-default-files-01' do
  impact 1.0
  title 'The stock CentOS repo files are removed'

  %w(/etc/yum.repos.d/centos.repo /etc/yum.repos.d/centos-addons.repo).each do |repo_file|
    describe file(repo_file) do
      it { should_not exist }
    end
  end
end

control 'yum-centos-default-repos-01' do
  impact 1.0
  title 'The default repos are enabled'

  %w(baseos appstream extras-common).each do |repo_id|
    describe yum.repo repo_id do
      it { should exist }
      it { should be_enabled }
    end
  end
end

control 'yum-centos-default-repos-02' do
  impact 0.7
  title 'The debug and source repos are present but disabled'

  %w(baseos appstream extras-common).each do |repo_id|
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

control 'yum-centos-default-repos-03' do
  impact 0.5
  title 'Optional repos are absent when not requested'

  %w(crb highavailability nfv rt resilientstorage).each do |repo_id|
    describe yum.repo repo_id do
      it { should_not exist }
    end
  end
end
