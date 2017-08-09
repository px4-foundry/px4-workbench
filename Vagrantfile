

Vagrant.configure("2") do |config|

  #Build out the docker container to use
  config.vm.provider "docker" do |d|
    d.build_dir = "."
  end

  #chef-zero implements the 'runner' psudeo interface
  config.vm.provision "chef_zero" do |chef|
    # Specify the local paths where Chef data is stored
    chef.install = 'true'
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.nodes_path = "nodes"
    chef.roles_path = "roles"
    # Add default recipes for main cookbooks
    chef.add_recipe "openssh"
    chef.add_recipe "osharden"


    # Or maybe a role
    chef.add_role "builder"
  end
end
