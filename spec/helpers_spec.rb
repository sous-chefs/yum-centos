# frozen_string_literal: true

require 'spec_helper'
require_relative '../libraries/helpers'

describe YumCentos::Cookbook::Helpers do
  let(:helper_class) do
    Class.new do
      include YumCentos::Cookbook::Helpers

      attr_reader :node

      def initialize(node)
        @node = node
      end
    end
  end

  let(:centos_stream_9_node) do
    Fauxhai.mock(platform: 'centos-stream', version: '9').data
  end

  let(:centos_stream_10_node) do
    Fauxhai.mock(platform: 'centos-stream', version: '9').data.tap do |node|
      node['platform_version'] = '10'
    end
  end

  let(:ubuntu_node) do
    Fauxhai.mock(platform: 'ubuntu', version: '24.04').data
  end

  it 'returns the default supported repo ids' do
    helper = helper_class.new(centos_stream_9_node)
    expect(helper.centos_default_repo_ids).to eq(%w(appstream baseos extras-common))
  end

  it 'uses the CentOS official key for Stream 9 core repos' do
    helper = helper_class.new(centos_stream_9_node)
    expect(helper.centos_repo_definition('baseos')[:gpgkey]).to eq(
      'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial'
    )
  end

  it 'uses the SHA256 CentOS official key for Stream 10 core repos' do
    helper = helper_class.new(centos_stream_10_node)
    expect(helper.centos_repo_definition('baseos')[:gpgkey]).to eq(
      'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256'
    )
  end

  it 'uses the extras SIG key for extras-common' do
    helper = helper_class.new(centos_stream_10_node)
    expect(helper.centos_repo_definition('extras-common')[:gpgkey]).to eq(
      'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras-SHA512'
    )
  end

  it 'builds a source repo definition with source architecture' do
    helper = helper_class.new(centos_stream_9_node)
    expect(helper.centos_repo_definition('crb', variant: :source)[:metalink]).to include('arch=source')
    expect(helper.centos_repo_definition('crb', variant: :source)[:repositoryid]).to eq('crb-source')
  end

  it 'reports supported stream platforms accurately' do
    expect(helper_class.new(centos_stream_10_node).centos_stream_platform?).to be(true)
    expect(helper_class.new(ubuntu_node).centos_stream_platform?).to be(false)
  end

  it 'returns the vendor repo paths that should be purged' do
    helper = helper_class.new(centos_stream_9_node)
    expect(helper.centos_vendor_repo_paths).to eq(
      %w(/etc/yum.repos.d/centos.repo /etc/yum.repos.d/centos-addons.repo)
    )
  end
end
