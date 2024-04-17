#!/usr/bin/env sh

cd ~

echo
echo "# Installing PHP 8.3 on Ubuntu 22.04 or 20.04"
echo "# Source: https://www.linuxcapable.com/how-to-install-php-8-3-on-ubuntu-linux/"

echo
echo "# Step 1: Update Ubuntu Before PHP 8.3 Installation"
echo
sudo apt update
sudo apt upgrade -y

echo
echo "# Step 2: Install Initial Packages for PHP PPA on Ubuntu"
echo
sudo apt install ca-certificates apt-transport-https software-properties-common lsb-release -y

echo
echo "# Step 3: Add PHP 8.3 PPA on Ubuntu 22.04 or 20.04"
echo
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt upgrade -y

echo
echo "# Install PHP 8.3"
echo
echo "Option 1: Install PHP as an Apache Module"
echo
sudo apt install php8.3 libapache2-mod-php8.3 -y
sudo systemctl restart apache2

echo
echo "# Verifying PHP 8.3 Installation via CLI"
echo
php --version

echo
echo "# Installing PHP extensions and libs needed by laravel"
echo
sudo apt install php8.3-xml php8.3-curl -y
sudo apt install libzip-dev zip unzip php-zip -y

echo
echo "# Install Composer"
echo "Source: https://getcomposer.org/download/"

# Command to check the hash of the installation file
hash=$(curl -sSL https://getcomposer.org/download/ | awk -F "'" '/php -r "if \(hash_file\('"'"'sha384'"'"', '"'"'composer-setup.php'"'"'\) === '\''[a-f0-9]+'\'')/ {print $6}')

echo
echo "# Command-line installation"
echo
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '$hash') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
echo
echo "# Moving composer.phar into a directory on your PATH, so you can simply call composer from any directory (Global install)"
sudo mv composer.phar /usr/local/bin/composer

echo
echo "# Show the Composer version"
echo
composer -V

echo
echo "Installing Symfony"
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt install symfony-cli

#Command to check the latest version of NVM
nvm_version=$(wget -qO- https://github.com/nvm-sh/nvm/releases/latest | grep -o 'v[0-9.]\+' | head -n 1)

echo
echo "# Installing NVM $nvm_version"
echo "Source: https://github.com/nvm-sh/nvm#installing-and-updating"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh | bash

echo
echo "Close and reopen the terminal to finish the installation of NVM"
