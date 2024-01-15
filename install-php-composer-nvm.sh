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

echo
echo "# Command-line installation"
echo
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
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
echo "# Installing NVM v0.39.5"
echo "Source: https://github.com/nvm-sh/nvm#installing-and-updating"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

echo
echo "Close and reopen the terminal for the changes to have effect."
