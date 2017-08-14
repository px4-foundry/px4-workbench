#!/bin/bash -v
mkdir ./working
pushd ./working
git clone https://github.com/chef/chef-provisioning-docker.git

pushd ./chef-provisioning-docker


CHEF_DRIVER=docker


#bundle install
#bundler executes chef-client in zero mode against the ruby description of an image
bundle exec chef-client -z ../../appliances/build-provisioner.rb
