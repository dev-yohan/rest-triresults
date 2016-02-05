# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "rbao/precise64-rails"
  config.vm.network 'private_network', ip: '192.168.100.122'
  config.vm.provision :shell, :path => 'vagrant.sh'
  config.vm.synced_folder ".", "/vagrant", nfs: true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
end