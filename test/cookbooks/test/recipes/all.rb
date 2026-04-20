# frozen_string_literal: true

supported_optional_repo_ids =
  if node['kernel']['machine'] == 'aarch64'
    %w(crb highavailability rt)
  else
    %w(crb highavailability nfv rt resilientstorage)
  end

yum_centos_repositories 'all' do
  repo_ids %w(baseos appstream extras-common) + supported_optional_repo_ids
  repo_overrides supported_optional_repo_ids.to_h { |repo_id| [repo_id, { 'enabled' => true }] }
end
