# sh-for-dev-env

Shell Script to automatize Github SSH, Docker and programming languages packages instalation for Ubuntu 22.04 and WSL2 systems.

## Instructions
Open the WSL2 Terminal and type the following commands to download and execute the installation scripts.
- Configure Github SSH and GPG (approximately 60s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/configure-git-ssh-gpg.sh && \
  bash configure-git-ssh-gpg.sh && \
  rm configure-git-ssh-gpg.sh*
~~~
- Install AWS CLI, kubectl, Terraform and Helm
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install_aws_cli_kubectl_terraform_helm.sh && \
  bash install_aws_cli_kubectl_terraform_helm.sh && \
  rm install_aws_cli_kubectl_terraform_helm.sh*
~~~
- Install Docker (approximately 40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-docker.sh && \
  bash install-docker.sh && \
  rm install-docker.sh*
~~~
- Install Google Cloud CLI
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-gcloud-cli.sh && \
  bash install-gcloud-cli.sh && \
  rm install-gcloud-cli.sh*
~~~
- Install Go (approximately 15s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-go.sh && \
  bash install-go.sh && \
  rm install-go.sh*
~~~
- Install Hugo
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-hugo.sh && \
  bash install-hugo.sh && \
  rm install-hugo.sh*
~~~
- Install Java 17 (approximately 35s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-java17-spring-boot.sh && \
  bash install-java17-spring-boot.sh && \
  rm install-java17-spring-boot.sh*
~~~
- Install Nvidia Container Toolkit (approximately 5m)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-nvidia-container-toolkit.sh && \
  bash install-nvidia-container-toolkit.sh && \
  rm install-nvidia-container-toolkit.sh*
~~~
- Install PHP 8.3, Composer, Laravel and Symfony NVM (approximately 1m40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-laravel-symfony.sh && \
  bash install-laravel-symfony.sh && \
  rm install-laravel-symfony.sh*
~~~
- Install MongoDB
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-mongodb.sh && \
  bash install-mongodb.sh && \
  rm install-mongodb.sh*
~~~
- Install Python (approximately 40s)
~~~shell
wget https://raw.githubusercontent.com/JefJrFigueiredo/sh-for-dev-env/main/install-python.sh && \
  bash install-python.sh && \
  rm install-python.sh*
~~~
