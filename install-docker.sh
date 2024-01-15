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
echo "Post-installation steps for Linux"
echo " Gerenciando Docker como usuário não-root"

echo
echo "Creating docker group"
sudo groupadd docker

echo
echo "Adding your user to the docker group"
sudo usermod -aG docker $USER

echo
echo "Reboot your system for the changes to take effect"
