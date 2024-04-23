#!/usr/bin/env sh

echo "Install MongoDB Community Edition"
echo "Source: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/"
echo
echo "Import the public key used by the package management system"
sudo apt-get install gnupg curl

echo "import the MongoDB public GPG key"
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "Create a list file for MongoDB"
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

echo "Reload local package database"
sudo apt-get update

echo "Install the MongoDB packages"
sudo apt-get install -y mongodb-org

echo "Start MongoDB"
sudo systemctl start mongod

echo "Verify that MongoDB has started successfully"
sudo systemctl status mongod

echo "Begin using MongoDB"
mongosh