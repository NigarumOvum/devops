#! /bin/bash

sudo apt-get update
sudo apt install gcc make perl

# Instalar docker y git
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Receiving a GPG error when running apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin git
sudo groupadd docker
sudo usermod -aGdocker $USER
newgrp docker
sudo chmod 666 /var/run/docker.sock
echo 'alias docker-compose="docker compose"' > ~/.bash_aliases