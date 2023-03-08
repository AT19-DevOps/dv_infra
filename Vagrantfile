# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config| 
  config.vm.box = "ubuntu/bionic64" 
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.provision :docker
  config.vm.provision :docker_compose

  config.vm.define "jenkinsserver" do |server1| 
    server1.vm.network "private_network", ip: '192.168.56.17' 
    server1.vm.hostname = "server1"
    server1.vm.provision :file, source:"docker-compose.yaml", destination:"docker-compose.yaml"
    server1.vm.provision :docker_compose, yml:"/home/vagrant/docker-compose.yaml", run:"always"
    server1.vm.provision :"shell", inline: "sudo chmod 777 /var/run/docker.sock && sudo chmod 777 /usr/bin/docker && sudo chmod 777 /.local"
  end
end
