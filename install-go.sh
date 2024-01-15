#!/usr/bin/env sh

# Source: https://go.dev/doc/install

# Command to check the latest version of Go
go_version=$(curl -sSL https://golang.org/dl/ 2>/dev/null | grep -oP 'go([0-9]+\.[0-9]+\.[0-9]+)\.linux-amd64.tar.gz' | head -n 1 | sed 's/go//;s/\.linux-amd64.tar.gz//')

echo
echo "Download and install Go ($go_version)"
wget https://go.dev/dl/go$go_version.linux-amd64.tar.gz

echo
echo "Remove any previous Go installation"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$go_version.linux-amd64.tar.gz

echo
echo "Add /usr/local/go/bin to the PATH environment variable"
# Source: https://www.oreilly.com/library/view/learning-go/9781492077206/ch01.html
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
source $HOME/.profile

echo
echo "Verify that you've installed Go"
go version

echo
echo "Removing installation package"
rm go$go_version.linux-amd64.tar.gz