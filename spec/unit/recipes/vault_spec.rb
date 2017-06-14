require 'spec_helper'

describe 'yum-centos::vault' do
  let(:chef_run) do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
