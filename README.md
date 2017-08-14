#!/bin/bash

echo 'todo: shim in our shell using rbenv'
echo 'todo: configure agnsotic docker container location settings'

echo 'todo: list packages, grep for vagant, git and docker.'
echo 'todo: if we dont find any, bounce'

#make sure we load up vagrant with relavant plugins
vagrant plugin install vagrant-env

#purge the .env file used by vagrant
mkdir $PWD/working
pushd $PWD/working
mkdir cookbooks
mkdir data_bags
mkdir roles
mkdir nodes

#clone cookbooks for provisioning node
pushd cookbooks
# git clone https://github.com/chef/ohai.git
# git clone https://github.com/chef/chef.git
# git clone https://github.com/dev-sec/chef-os-hardening


#build out some basic tools to implement automation on the provisoning node
# git clone https://supermarket.chef.io/cookbooks/nodejs
# git clone https://gitlab.com/s4m-chef-repositories/docker-platform.git
# git clone https://github.com/chef-partners/google-compute-engine.git

echo 'todo:create cookbook for processIO'




#set environment parameters for vagrant to build out the provisioning node
# echo COOKBOOK_PATH='cookbooks' >> .env
# echo DATA_BAGS_PATH='data_bags' >> .env
# echo ROLES_PATH='roles' >> .env
# echo NODES_PATH='nodes' >> .env
#start vagrant and 1. build a docker container and run chef-commands to build out our provisioning node
vagrant reload
vagrant up --provider docker
