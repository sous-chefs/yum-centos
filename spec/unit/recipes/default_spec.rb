require 'spec_helper'

describe 'yum-centos::default' do
  %w(6 7 8).each do |v|
    context "centos-#{v}" do
      platform 'centos', v
      %w(contrib cr debuginfo fasttrack plus powertools).each do |repo|
        it do
          expect(chef_run).to_not create_yum_repository(repo)
        end
      end
      case v.to_i
      when 6, 7
        it do
          expect(chef_run).to create_yum_repository('base')
            .with(mirrorlist: "http://mirrorlist.centos.org/?release=#{v}&arch=$basearch&repo=os")
        end
        it do
          expect(chef_run).to create_yum_repository('updates')
            .with(mirrorlist: "http://mirrorlist.centos.org/?release=#{v}&arch=$basearch&repo=updates")
        end
        it do
          expect(chef_run).to create_yum_repository('extras')
            .with(mirrorlist: "http://mirrorlist.centos.org/?release=#{v}&arch=$basearch&repo=extras&infra=$infra")
        end
      when 8
        it do
          expect(chef_run).to create_yum_repository('base')
            .with(mirrorlist: "http://mirrorlist.centos.org/?release=#{v}&arch=$basearch&repo=BaseOS&infra=$infra")
        end
        it do
          expect(chef_run).to create_yum_repository('appstream')
            .with(mirrorlist: "http://mirrorlist.centos.org/?release=#{v}&arch=$basearch&repo=AppStream&infra=$infra")
        end
        it do
          expect(chef_run).to create_yum_repository('extras')
            .with(mirrorlist: "http://mirrorlist.centos.org/?release=#{v}&arch=$basearch&repo=extras&infra=$infra")
        end
      end
    end
  end
end
