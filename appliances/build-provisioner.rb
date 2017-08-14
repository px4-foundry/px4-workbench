## Script to use docker and chef-sero to stand up a chef-provisoning node for our infrastructure

require 'chef/provisioning/docker_driver'
with_driver 'docker'


machine 'px4-infrastructure-engine' do
  recipe 'openssh::default'
  

  machine_options(
    docker_options: {
      base_image: {
        name: 'ubuntu',
        repository: 'ubuntu',
        tag: '14.04'
        },
        :command => '/usr/sbin/sshd -p 8022 -D',

        #ENV (Environment Variables)
        #Set any env var in the container by using one or more -e flags, even overriding those already defined by the developer with a Dockerfile ENV
        :env => {
           "deep" => 'purple',
           "led" => 'zeppelin'
        },

        # Ports can be one of two forms:
        # src_port (string or integer) is a pass-through, i.e 8022 or "9933"
        # src:dst (string) is a map from src to dst, i.e "8022:8023" maps 8022 externally to 8023 in the container

        # Example (multiple):
        :ports => [8022, "8023:9000", "9500"],

        # Examples (single):
        :ports => 1234,
        :ports => "2345:6789",

        # Volumes can be one of three forms:
        # src_volume (string) is volume to add to container, i.e. creates new volume inside container at "/tmp"
        # src:dst (string) mounts host's directory src to container's dst, i.e "/tmp:/tmp1" mounts host's directory /tmp to container's /tmp1
        # src:dst:mode (string) mounts host's directory src to container's dst with the specified mount option, i.e "/:/rootfs:ro" mounts read-only host's root (/) folder to container's /rootfs
        # See more details on Docker volumes at https://github.com/docker/docker/blob/master/docs/sources/userguide/dockervolumes.md .

        # Example (single):
        :volumes => "/tmp",

        # Example (multiple):
        :volumes => ["/tmp:/tmp", "/:/rootfs:ro"],

        # if you need to keep stdin open (i.e docker run -i)
        # :keep_stdin_open => true

      },
      # optional, default timeout is 600
      docker_connection: {
       :read_timeout => 1000,
      }
    )
  end
