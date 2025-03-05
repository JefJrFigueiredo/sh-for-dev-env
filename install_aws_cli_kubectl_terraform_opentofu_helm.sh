#!/usr/bin/env sh

echo "Script for installing kubectl, Terraform, OpenTofu, Helm and AWS CLI on Ubuntu"

echo
echo "Install kubectl on Linux"
echo "Source: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/"

echo
echo "Install kubectl binary with curl on Linux"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

echo
echo "Validate the binary (optional)"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

echo
echo "Install kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo
echo "Verify kubectl installation"
kubectl version --client

echo
echo "Remove the downloaded files"
rm kubectl kubectl.sha256

echo
echo "Install Terraform on Ubuntu"
echo "Source: https://developer.hashicorp.com/terraform/install#linux"

echo 
echo "Update the package index"
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

echo
echo "Verify Terraform installation"
terraform -version

echo
echo "Installing OpenTofu"
echo "Source: https://opentofu.org/docs/intro/install/snap/"
snap install --classic opentofu
if [ -f "$HOME/.bashrc" ]; then
    echo "alias opentofu='/snap/bin/opentofu.tofu'" >> ~/.bashrc
    source "$HOME/.bashrc"
fi
if [ -f "$HOME/.zshrc" ]; then
    echo "alias opentofu='/snap/bin/opentofu.tofu'" >> ~/.zshrc
    source "$HOME/.zshrc"
fi
opentofu -version

echo
echo "Install Helm on Debian/Ubuntu"
echo "Source: https://helm.sh/docs/intro/install/"

echo
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install -y helm

echo
echo "Verify Helm installation"
helm version

echo "Install AWS CLI"
echo "Source: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"

echo
echo "Uninstall the pre-installed yum version"
sudo yum remove awscli

echo
echo "Install the AWS CLI v2"
sudo apt install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo
echo "Verify AWS CLI installation"
aws --version

echo "Remove the downloaded files"
rm awscliv2.zip

echo
echo "At this moment, you should already have an AIM user. If you don't have one, follow the steps below:"
echo "Go to the AWS Console: https://aws.amazon.com/ and sign in"
echo "Search for the IAM service"
echo "> Create user"
echo "    > User name: \"cli-user\""
echo "    > Don't provide user access to the AWS Management Console"
echo "    > Attach existing policies directly"
echo "        > Policy: AmazonEC2FullAccess"
echo "        > Policy: AmazonS3FullAccess"
echo "        > Policy: AmazonEKSClusterPolicy"
echo "        > Policy: AmazonEKSServicePolicy"
echo "        > Policy: AmazonEKSVPCResourceController"
echo "        > Policy: AmazonEKSWorkerNodePolicy"
echo "        > Policy: AmazonVPCFullAccess"
echo "    > Create user"
echo "> cli-user"
echo "    > Security credentials"
echo "        > Create access key"
echo "            > Use case: Command Line Interface (CLI)"
echo "            > Confirm"
echo "            > Save the access key ID and secret access key in a secure place"
echo "            > Be prepared to use them next"

echo
echo "Authenticate in the AWS CLI with the cli-user"
echo "    > AWS Access Key ID [None]: <access key ID>"
echo "    > AWS Secret Access Key: <secret access"
echo "    > Default region name [None]: \"us-east-1\""
echo "    > Default output format [None]: yaml"
aws configure

echo
echo "Verify kubectl installation"
kubectl version --client
echo
echo "Verify Terraform installation"
terraform -version
echo
echo "Verify Helm installation"
helm version
echo
echo "Verify AWS CLI installation"
aws --version
echo
echo "Verify OpenTofu installation"
opentofu -version
