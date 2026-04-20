# frozen_string_literal: true

provides :yum_centos_repository
unified_mode true

use '_partial/_common'
include YumCentos::Cookbook::Helpers

property :repo_id, String, name_property: true

action_class do
  include YumCentos::Cookbook::Helpers

  def merged_repo_definition(variant)
    defaults = centos_repo_definition(new_resource.repo_id, variant: variant)

    {
      description: new_resource.description || defaults[:description],
      baseurl: new_resource.baseurl || defaults[:baseurl],
      metalink: new_resource.metalink || defaults[:metalink],
      gpgkey: new_resource.gpgkey || defaults[:gpgkey],
      gpgcheck: new_resource.gpgcheck.nil? ? defaults[:gpgcheck] : new_resource.gpgcheck,
      repo_gpgcheck: new_resource.repo_gpgcheck.nil? ? defaults[:repo_gpgcheck] : new_resource.repo_gpgcheck,
      metadata_expire: new_resource.metadata_expire || defaults[:metadata_expire],
      enabled: case variant
               when :debug
                 new_resource.debug_enabled
               when :source
                 new_resource.source_enabled
               else
                 new_resource.enabled.nil? ? defaults[:enabled] : new_resource.enabled
               end,
      repositoryid: defaults[:repositoryid],
    }
  end

  def converge_repo(variant)
    repo_definition = merged_repo_definition(variant)

    yum_repository repo_definition[:repositoryid] do
      repositoryid repo_definition[:repositoryid]
      description repo_definition[:description]
      baseurl repo_definition[:baseurl] unless repo_definition[:baseurl].nil?
      metalink repo_definition[:metalink] unless repo_definition[:metalink].nil?
      gpgkey repo_definition[:gpgkey]
      gpgcheck repo_definition[:gpgcheck]
      repo_gpgcheck repo_definition[:repo_gpgcheck]
      metadata_expire repo_definition[:metadata_expire]
      enabled repo_definition[:enabled]
      options new_resource.options unless new_resource.options.empty?
      action :create
    end
  end
end

action :create do
  return unless centos_stream_platform?

  converge_repo(:main)
  converge_repo(:debug)
  converge_repo(:source)
end

action :delete do
  return unless centos_stream_platform?

  %i(main debug source).each do |variant|
    yum_repository centos_repo_identifier(new_resource.repo_id, variant) do
      action :remove
    end
  end
end
