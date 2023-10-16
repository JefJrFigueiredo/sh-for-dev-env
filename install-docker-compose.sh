#!/usr/bin/env sh

echo
echo "# Install Docker Compose"
echo

echo "\n\n# Testing Docker as a non-root user"
docker run hello-world

echo "\n\n# Install Docker Compose."
sudo apt-get -y update
sudo apt-get -y install docker-compose-plugin

echo "\n\n# Testing instalation"
docker compose version
