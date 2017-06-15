require 'spec_helper'

describe 'yum-centos::default' do
  cached(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'creates yum_repository[base]' do
    expect(chef_run).to create_yum_repository('base')
      .with(mirrorlist: 'http://mirrorlist.centos.org/?release=7&arch=$basearch&repo=os')
  end
  it 'creates yum_repository[updates]' do
    expect(chef_run).to create_yum_repository('updates')
      .with(mirrorlist: 'http://mirrorlist.centos.org/?release=7&arch=$basearch&repo=updates')
  end
  it 'creates yum_repository[extras]' do
    expect(chef_run).to create_yum_repository('extras')
      .with(mirrorlist: 'http://mirrorlist.centos.org/?release=7&arch=$basearch&repo=extras')
  end
end
