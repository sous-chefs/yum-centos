require 'spec_helper'

describe 'yum-centos::vault' do
  %w(6 7 8).each do |v|
    context "centos-#{v}" do
      platform 'centos', v
      it do
        expect(chef_run).to create_yum_repository('extras')
          .with(
            mirrorlist: nil,
            baseurl: %r{http://vault.centos.org/#{v}.*/extras/\$basearch/}
          )
      end
      case v.to_i
      when 6, 7
        it do
          expect(chef_run).to create_yum_repository('base')
            .with(
              mirrorlist: nil,
              baseurl: %r{http://vault.centos.org/#{v}.*/os/\$basearch/}
            )
        end
        it do
          expect(chef_run).to create_yum_repository('updates')
            .with(
              mirrorlist: nil,
              baseurl: %r{http://vault.centos.org/#{v}.*/updates/\$basearch/}
            )
        end
      when 8
        it do
          expect(chef_run).to create_yum_repository('base')
            .with(
              mirrorlist: nil,
              baseurl: %r{http://vault.centos.org/#{v}.*/BaseOS/\$basearch/}
            )
        end
        it do
          expect(chef_run).to create_yum_repository('appstream')
            .with(
              mirrorlist: nil,
              baseurl: %r{http://vault.centos.org/#{v}.*/AppStream/\$basearch/}
            )
        end
      end
    end
  end
end
