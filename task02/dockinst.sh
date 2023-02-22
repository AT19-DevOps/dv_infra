#!/bin/bash
echo "+++++++++++++++++++++++++"
echo "Installing Docker"
echo "+++++++++++++++++++++++++"
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get -y upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt-get install -y docker-compose
echo "+++++++++++++++++++++++++"
docker --version
echo "+++++++++++++++++++++++++"
sudo service docker start
echo "+++++++++++++++++++++++++"
docker-compose --version
echo "+++++++++++++++++++++++++"
