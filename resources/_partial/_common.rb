# frozen_string_literal: true

property :description, [String, NilClass], default: nil
property :baseurl, [String, NilClass], default: nil
property :metalink, [String, NilClass], default: nil
property :gpgkey, [String, NilClass], default: nil
property :gpgcheck, [TrueClass, FalseClass, NilClass], default: nil
property :repo_gpgcheck, [TrueClass, FalseClass, NilClass], default: nil
property :metadata_expire, [String, NilClass], default: nil
property :enabled, [TrueClass, FalseClass, NilClass], default: nil
property :debug_enabled, [TrueClass, FalseClass], default: false
property :source_enabled, [TrueClass, FalseClass], default: false
property :options, Hash, default: {}
