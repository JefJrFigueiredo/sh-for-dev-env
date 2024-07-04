#!/usr/bin/env sh

# Source: https://gohugo.io/installation/linux/

echo "Installing Dart Sass"
sudo snap install dart-sass

echo "Installing Hugo"
sudo snap install hugo

echo "Install useful VSCode extensions"
eval $(curl -s https://gohugo.io/tools/editors/ | grep -oP '(?<=itemName=)[^"]*' | awk '{print "code --install-extension " $0 " &&"}' | sed '$ s/&&$//')
