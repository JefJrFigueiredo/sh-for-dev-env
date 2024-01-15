#!/usr/bin/env sh

# How to Install Python 3.12 on Ubuntu 22.04
# Source: https://www.linuxtuto.com/how-to-install-python-3-12-on-ubuntu-22-04/

# Update Operating System
sudo apt update && sudo apt upgrade -y

# Method 1: Install Python 3.12 with APT
    # Install the prerequisite for adding custom PPAs:
    sudo apt install software-properties-common -y

    # Then proceed and add the deadsnakes PPA to the APT package manager sources list:
    sudo add-apt-repository ppa:deadsnakes/ppa -y

    # Once the repository has been installed, run an APT update to ensure that the newly imported PPA is reflected.
    sudo apt update

    # You can now install Python 3.12 with the following command:
    sudo apt install python3.12 -y

    echo "verify the installation and Python 3.12 build version:"
    python3.12 --version

    # If you have installed Python 3.12 using the APT package manager, the PIP will not be installed by default. To install PIP, run the following command:
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12 

    echo "Reboot the Ubuntu and run ´pip3.12 -V´ to check PIP for the Python 3.12 version"