#!/usr/bin/env sh

echo
echo "# Install Docker Compose"
echo

echo "# Testing Docker as a non-root user"
docker run hello-world

echo 
echo "# Install Docker Compose."
sudo apt-get -y update
sudo apt-get -y install docker-compose-plugin

echo 
echo "# Testing instalation"
docker compose version
