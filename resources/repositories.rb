# frozen_string_literal: true

provides :yum_centos_repositories
unified_mode true
include YumCentos::Cookbook::Helpers

property :repo_ids, Array,
         coerce: proc { |value| Array(value).map(&:to_s) },
         default: lazy { centos_default_repo_ids }
property :enable_repo_ids, Array,
         coerce: proc { |value| Array(value).map(&:to_s) },
         default: []
property :repo_overrides, Hash, default: {}
property :purge_vendor_files, [true, false], default: true, desired_state: false

action_class do
  include YumCentos::Cookbook::Helpers

  def validate_repo_ids(repo_ids)
    unsupported_repo_ids = repo_ids - centos_supported_repo_ids
    raise ArgumentError, "Unsupported yum-centos repo ids: #{unsupported_repo_ids.sort.join(', ')}" unless unsupported_repo_ids.empty?

    repo_ids
  end

  def validated_repo_ids
    @validated_repo_ids ||= validate_repo_ids(
      new_resource.repo_ids.map { |repo_id| resolve_centos_repo_id(repo_id) }.uniq
    )
  end

  def validated_enable_repo_ids
    @validated_enable_repo_ids ||= validate_repo_ids(
      new_resource.enable_repo_ids.map { |repo_id| resolve_centos_repo_id(repo_id) }.uniq
    )
  end

  def managed_repo_ids
    (validated_repo_ids + validated_enable_repo_ids).uniq
  end

  def repo_properties_for(repo_id)
    default_properties = validated_enable_repo_ids.include?(repo_id) ? { 'enabled' => true } : {}
    default_properties.merge(new_resource.repo_overrides.fetch(repo_id, {}))
  end
end

action :create do
  return unless centos_stream_platform?

  if new_resource.purge_vendor_files
    centos_vendor_repo_paths.each do |path|
      file path do
        action :delete
      end
    end
  end

  managed_repo_ids.each do |repo_id|
    yum_centos_repository repo_id do
      repo_properties_for(repo_id).each do |property_name, property_value|
        public_send(property_name, property_value)
      end
    end
  end
end

action :delete do
  return unless centos_stream_platform?

  managed_repo_ids.each do |repo_id|
    yum_centos_repository repo_id do
      action :delete
    end
  end
end
