# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.configure("2") do |config|

  config.vm.hostname = "serf-cookbook-berkshelf"
  config.vm.box = "Ubuntu13.10"

  config.vm.network :private_network, ip: "192.168.10.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "256"]
  end

  config.berkshelf.berksfile_path = "./Berksfile"
  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
        "recipe[serf-cookbook::default]"
    ]
  end
end
