# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/focal64"

  # Set the hostname
  config.vm.hostname = "astroid"

  # Define disk size
  config.disksize.size = '40GB'

  # Disable the default shared folder
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # Create shared folder
  config.vm.synced_folder "share", "/media/share", create: true, type: "virtualbox"

  # Install web things here
  config.vm.provision "shell", path: "setup.sh"

  # Setup a private network
  config.vm.network "private_network", ip: "192.168.56.101"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"

    # Set vCPUs
    vb.cpus = 1
  end
end
