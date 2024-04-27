#!/usr/bin/env sh

echo "Installing Google Cloud CLI"
echo "Source: https://cloud.google.com/sdk/docs/install-sdk#deb"

echo "Updating packages"
sudo apt-get update

echo "Installing apt-transport-https and curl"
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

echo "Importing the Google Cloud public key"
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "Adding the gcloud CLI distribution URI as a package source"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

echo "Updating and installing the gcloud CLI"
sudo apt-get update && sudo apt-get install -y google-cloud-cli

echo "Running gcloud init to get started"
gcloud init