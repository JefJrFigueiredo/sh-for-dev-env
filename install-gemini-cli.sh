#!/usr/bin/env sh

# Source: https://nodejs.org/en/download

#Command to check the latest version of NVM
nvm_version=$(wget -qO- https://github.com/nvm-sh/nvm/releases/latest | grep -o 'v[0-9.]\+' | head -n 1)

echo
echo "# Installing NVM $nvm_version"
echo "Source: https://github.com/nvm-sh/nvm#installing-and-updating"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh | bash

# To restart the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

echo
echo "# Installing Gemini CLI"
echo "Source: https://github.com/google-gemini/gemini-cli"

# Install CLI
npm install -g @google/gemini-cli