#!/usr/bin/env sh

echo
echo "Installing AWS Elastic Beanstalk prerequisites"

echo
echo "Installing Pyenv via Homebrew"
brew update
brew install pyenv

echo
echo "Making Pyenv Post-installation steps"
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile

