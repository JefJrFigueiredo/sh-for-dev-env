# sh-for-dev-env

Shell Script to automatize Github SSH, Docker and programming languages packages instalation for Ubuntu 22.04 and WSL2 systems.

## Instructions
Open the WSL2 Terminal and type the following commands to download and execute the installation scripts.
- Configure Github SSH (approximately 1m30s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/configure-git-ssh.sh && \
  bash configure-git-ssh.sh && \
  rm configure-git-ssh.sh
~~~
- Install Docker (approximately 30s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-docker.sh && \
  bash install-docker.sh && \
  rm install-docker.sh
~~~
- Install Go (approximately 15s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-go.sh && \
  bash install-go.sh && \
  rm install-go.sh
~~~
- Install PHP 8.3, Composer and NVM (approximately 1m40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-php-composer-nvm.sh && \
  bash install-php-composer-nvm.sh && \
  rm install-php-composer-nvm.sh
~~~
- Install Python (approximately 40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-python.sh && \
  bash install-python.sh && \
  rm install-python.sh
~~~
