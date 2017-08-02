#
# Cookbook Name:: px4-ros-workbench
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'px4-ros-workbench::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'installs or verifies target docker services' do
      expect { chef_run }.to install_package 'docker'
    end

    it 'includes recipe that pulls docker build environment' do
      expect { chef_run }.includes_recipe 'px4-build-environment'
    end

    it 'pull'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
