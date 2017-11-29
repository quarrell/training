# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "slave" do |slave|
    slave.vm.box = "centos/7"
    slave.vm.provision :shell, path: "base.sh", privileged: true
    slave.vm.provision :shell, path: "slave_inst.sh", privileged: true
    slave.vm.network :private_network, ip: "192.168.50.52"
  end
  config.vm.define "host_vm" do |host_vm|
    host_vm.vm.box = "centos/7"
    host_vm.vm.network :private_network, ip: "192.168.50.51"
    host_vm.vm.provision :shell, path: "base.sh", privileged: true
    host_vm.vm.provision :shell, path: "inst.sh", privileged: true
  end

end
