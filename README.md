# sh-for-dev-env

Shell Script to automatize Github SSH and Docker instalation for Linux and WSL2 systems.

## Instructions
Open the WSL2 Terminal and type the following commands to download and execute the installation scripts.
- Configure Github SSH
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/configure-git-ssh.sh && \
bash configure-git-ssh.sh && \
rm configure-git-ssh.sh
~~~
- Install Docker
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-docker.sh && \
bash install-docker.sh && \
rm install-docker.sh
~~~
