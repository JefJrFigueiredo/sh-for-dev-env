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
- (optional) Install Docker
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-docker.sh && \
  bash install-docker.sh && \
  rm install-docker.sh
~~~
- (optional) Install Go
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-go.sh && \
  bash install-go.sh && \
  rm install-go.sh
~~~
- (optional) Install PHP, Composer and NVM
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-php-composer-nvm.sh && \
  bash install-php-composer-nvm.sh && \
  rm install-php-composer-nvm.sh
~~~
- (optional) Install Python
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-python.sh && \
  bash install-python.sh && \
  rm install-python.sh
~~~
