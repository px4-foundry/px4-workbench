require 'chef/provisioning/docker_driver'

machine_image 'node_server' do
  recipe 'openssh'

  machine_options(
    :docker_options => {
      :base_image => {
          :name => 'ubuntu',
          :repository => 'ubuntu',
          :tag => '14.04'
      }
    }
  )
end

machine 'njs00' do
  from_image 'node_server'

  machine_options(
    :docker_options => {
      :command => '/usr/sbin/sshd -D -o UsePAM=no -o UsePrivilegeSeparation=no -o PidFile=/tmp/sshd.pid',
      :ports => [22, 80, 8080]
    }
  )
end
