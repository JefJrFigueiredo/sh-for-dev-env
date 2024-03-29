#!/usr/bin/env sh

echo "Installing the NVIDIA Container Toolkit"
echo "Source: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-apt"

echo
echo "Installing with Apt"
echo "1. Configure the production repository:"
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo
echo "2. Update the packages list from the repository:"
sudo apt-get update

echo
echo "3. Install the NVIDIA Container Toolkit packages:"
sudo apt-get install -y nvidia-container-toolkit

echo
echo "Install NVIDIA GPU Driver for WSL2-Ubuntu"
echo "Source: https://docs.nvidia.com/cuda/cuda-installation-guide-linux/"

echo
echo "Install GCC compiler"
sudo apt -y install gcc

wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda_12.4.0_550.54.14_linux.run
sudo sh cuda_12.4.0_550.54.14_linux.run

/usr/local/cuda-12.4/extras/demo_suite/deviceQuery
