#!/bin/bash

echo 'todo: shim in our shell using virtualenv'
echo 'todo: configure agnsotic docker container location settings'


#make sure we load up vagrant with relavant plugins
vagrant plugin install vagrant-env

#purge the .env file used by vagrant

#shove these in an .env file for Vagrant
echo ROOT_PATH='~/' >> .env
echo COOKBOOK_PATH='cookbooks' >> .env
echo DATA_BAGS_PATH='data_bags' >> .env

echo ROLES_PATH='roles' >> .env
echo NODES_PATH='nodes' >> .env


mkdir ~/px4-system
pushd ~/px4-system
mkdir cookbooks
mkdir data_bags
mkdir roles
mkdir nodes

#start vagrant and 1. build a docker container and run chef-commands to build out our provisioning node
vagrant up
