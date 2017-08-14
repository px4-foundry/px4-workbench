#!/bin/bash -v
mkdir ./working
pushd ./working
git clone https://github.com/chef/chef-provisioning-docker.git

pushd ./chef-provisioning-docker

eval "$(rbenv init -)"
rbenv shell chefdk
rbenv rehash
bundle install
#bundler executes chef-client in zero mode against the ruby description of an image
 CHEF_DRIVER=docker bundle exec chef-client -z ../../appliances/build-provisioner.rb
