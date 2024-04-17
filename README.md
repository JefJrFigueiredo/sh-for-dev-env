# sh-for-dev-env

Shell Script to automatize Github SSH, Docker and programming languages packages instalation for Ubuntu 22.04 and WSL2 systems.

## Instructions
Open the WSL2 Terminal and type the following commands to download and execute the installation scripts.
- Configure Github SSH (approximately 60s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/configure-git-ssh.sh && \
  bash configure-git-ssh.sh && \
  rm configure-git-ssh.sh
~~~
- Install Docker (approximately 40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-docker.sh && \
  bash install-docker.sh && \
  rm install-docker.sh
~~~
- Install Homebrew
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-homebrew.sh && \
  bash install-homebrew.sh && \
  rm install-homebrew.sh
~~~
- Install Go (approximately 15s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-go.sh && \
  bash install-go.sh && \
  rm install-go.sh
~~~
- Install Java 17 (approximately 35s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-java17-spring-boot.sh && \
  bash install-java17-spring-boot.sh && \
  rm install-java17-spring-boot.sh
~~~
- Install Nvidia Container Toolkit (approximately 5m)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-nvidia-container-toolkit.sh && \
  bash install-nvidia-container-toolkit.sh && \
  rm install-nvidia-container-toolkit.sh
~~~
- Install PHP 8.3, Composer, Laravel and Symfony NVM (approximately 1m40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-laravel-symfony.sh && \
  bash install-laravel-symfony.sh && \
  rm install-laravel-symfony.sh
~~~
- Install Python (approximately 40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-python.sh && \
  bash install-python.sh && \
  rm install-python.sh
~~~
