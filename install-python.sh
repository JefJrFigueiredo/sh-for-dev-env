#!/usr/bin/env sh

# Source: https://www.linuxtuto.com/how-to-install-python-3-12-on-ubuntu-22-04/

#Command to check the latest version of Python
python_version=$(curl -sSL https://www.python.org/downloads/ | grep -oP 'Python ([0-9]+\.[0-9]+\.[0-9]+)' | head -n 1 | sed -E 's/Python ([0-9]+\.[0-9]+)\.[0-9]+/\1/')

echo
echo "Install Python $python_version on Ubuntu 22.04"

# Update Operating System
sudo apt update && sudo apt upgrade -y

echo "Method 1: Install Python $python_version with APT"
    # Install the prerequisite for adding custom PPAs:
    sudo apt install software-properties-common -y

    # Then proceed and add the deadsnakes PPA to the APT package manager sources list:
    sudo add-apt-repository ppa:deadsnakes/ppa -y

    # Once the repository has been installed, run an APT update to ensure that the newly imported PPA is reflected.
    sudo apt update

    echo "You can now install Python $python_version with the following command:"
    sudo apt install python$python_version -y

    echo "verify the installation and Python $python_version build version:"
    python$python_version --version

    echo "Install PIP"
    curl -sS https://bootstrap.pypa.io/get-pip.py | python$python_version

    echo "Reboot the Ubuntu and run ´pip -V´ to check PIP for the Python 3.12 version"