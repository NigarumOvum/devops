sudo apt update
sudo apt install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
newgrp docker

docker version
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl restart docker
sudo systemctl status docker

adduser noroot_user
su - noroot_user
usermod -aG sudo noroot_user

sudo apt-get update
sudo apt-get -y install python3-pip
sudo pip install docker-compose
sudo apt install docker.io

docker --version
docker-compose --version
