#!/usr/bin/env sh

echo
echo "Uninstalling previous versions of Docker"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

echo
echo "Add Docker's official GPG key:"
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl gnupg
sudo -y install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo
echo "Add the repository to Apt sources:"
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

echo
echo "Install the Docker packages."
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo
echo "Verify that the Docker Engine installation is successful by running the hello-world image."
sudo docker run hello-world

echo
echo "Passos de pós-instalação para Linux"
echo " Gerenciando Docker como usuário não-root"

echo
echo "Criando o grupo docker"
sudo groupadd docker

echo
echo "Adicionando seu usuário no grupo docker"
sudo usermod -aG docker $USER

sudo echo
echo "Shutting down WSL in 3"
sleep 1
echo "Shutting down WSL in 2"
sleep 1
echo "Shutting down WSL in 1"
sleep 1
echo "Shutting down WSL in 0"
sleep 1
sudo shutdown