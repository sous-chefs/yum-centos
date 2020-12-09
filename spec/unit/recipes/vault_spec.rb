require 'spec_helper'

describe 'yum-centos::vault' do
  %w(
    7.7.1908
    8.0.1905
  ).each do |v|
    context "centos-#{v.to_i}" do
      platform 'centos', v.split('.')[0]
      case v.to_i
      when 7
        it do
          expect(chef_run).to create_yum_repository("centos-vault-#{v}-base")
            .with(
              baseurl: "http://vault.centos.org/#{v}/os/$basearch/"
            )
        end
        it do
          expect(chef_run).to create_yum_repository("centos-vault-#{v}-updates")
            .with(
              baseurl: "http://vault.centos.org/#{v}/updates/$basearch/"
            )
        end
        it do
          expect(chef_run).to create_yum_repository("centos-vault-#{v}-extras")
            .with(
              baseurl: "http://vault.centos.org/#{v}/extras/$basearch/"
            )
        end
      when 8
        it do
          expect(chef_run).to create_yum_repository("centos-vault-#{v}-base")
            .with(
              baseurl: "http://vault.centos.org/#{v}/BaseOS/$basearch/os/"
            )
        end
        it do
          expect(chef_run).to create_yum_repository("centos-vault-#{v}-appstream")
            .with(
              baseurl: "http://vault.centos.org/#{v}/AppStream/$basearch/os/"
            )
        end
        it do
          expect(chef_run).to create_yum_repository("centos-vault-#{v}-extras")
            .with(
              baseurl: "http://vault.centos.org/#{v}/extras/$basearch/os/"
            )
        end
      end
    end
  end
  # Make sure we don't break non-RHEL systems which simply include this cookbook
  context 'ubuntu' do
    platform 'ubuntu'
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
