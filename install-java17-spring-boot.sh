#!/usr/bin/env sh

# Source: https://spring.io/quickstart

# Command to check the latest version of Go
# go_version=$(curl -sSL https://golang.org/dl/ 2>/dev/null | grep -oP 'go([0-9]+\.[0-9]+\.[0-9]+)\.linux-amd64.tar.gz' | head -n 1 | sed 's/go//;s/\.linux-amd64.tar.gz//')


echo 
echo "Download and install BellSoft Liberica JDK version 17"
# Source: https://docs.bell-sw.com/liberica-jdk/17.0.10b13/general/install-guide/#linux

echo 
echo "APT Repository (.deb-based Linux distributions)"
echo "Add BELLSOFT official GPG key and set up the repository. Adding the GPG key is required only once on a computer."
wget -q -O - https://download.bell-sw.com/pki/GPG-KEY-bellsoft | sudo apt-key add -
echo "deb https://apt.bell-sw.com/ stable main" | sudo tee /etc/apt/sources.list.d/bellsoft.list

echo 
echo "Update repositories and install packages."
sudo apt-get update
sudo apt-get install bellsoft-java17

echo 
echo "Verifying your installation"
java -version

echo 
echo "Go to https://spring.io/quickstart and Start a new Spring Boot project"