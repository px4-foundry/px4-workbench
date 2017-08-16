#!/bin/bash -v
mkdir ./working
pushd ./working
git clone https://github.com/chef/chef-provisioning-docker.git

pushd ./chef-provisioning-docker

eval "$(docker-machine env default)"

eval "$(rbenv init -)"
rbenv shell chefdk
rbenv rehash

export CHEF_DRIVER=docker

#bundle install
#bundler executes chef-client in zero mode against the ruby description of an image
 bundle exec chef-client -z /home/christopher/px4-operations/px4-workbench/appliances/destroy-provisioner.rb
