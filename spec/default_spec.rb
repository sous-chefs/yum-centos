# Encoding: utf-8

require 'spec_helper'

describe 'yum-centos::default' do
  context 'yum-centos::default uses default attributes' do
    let(:chef_run) { ChefSpec::Runner.new(:step_into => ['yum_repository']).converge(described_recipe) }

    context 'removing stock configuration files' do
      it 'deletes yum_repository[CentOS-Base]' do
        expect(chef_run).to delete_yum_repository('CentOS-Base')
      end

      it 'steps into yum_repository and deletes file /etc/yum.repos.d/CentOS-Base.repo' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/CentOS-Base.repo')
      end

      it 'deletes yum_repository[CentOS-Debuginfo]' do
        expect(chef_run).to delete_yum_repository('CentOS-Debuginfo')
      end

      it 'deletes yum_repository[CentOS-Media]' do
        expect(chef_run).to delete_yum_repository('CentOS-Media')
      end

      it 'deletes yum_repository[CentOS-Vault]' do
        expect(chef_run).to delete_yum_repository('CentOS-Vault')
      end
    end

    context 'rendering centos yum channel repositories' do
      %w{ base updates extras centosplus contrib}.each do |repo|
        it "creates yum_repository[#{repo}]" do
          expect(chef_run).to create_yum_repository(repo)
        end

        it "steps into yum_repository and creates template[/etc/yum.repos.d/#{repo}.repo]" do
          expect(chef_run).to render_file("/etc/yum.repos.d/#{repo}.repo")
        end
      end
    end

  end
end
