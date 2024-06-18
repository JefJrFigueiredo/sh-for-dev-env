#!/usr/bin/env sh

# Source: https://nodejs.org/en/download/package-manager

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js (you may need to restart the terminal)
nvm install 20

#Close and reopen your terminal to start using nvm or run the following to use it now:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# verifies the right Node.js version is in the environment
node -v # should print `v20.14.0`
# verifies the right NPM version is in the environment
npm -v # should print `10.7.0`

npm install -g @nestjs/cli
npm install  @nestjs/jwt
npm install bcrypt
npm install @prisma/client

sudo apt install openssl

nest new nestjs-multitenancy
# npm > enter
#install extensions: ESLint, Prettier, REST client, Prisma.

cd nestjs-multitenancy
npm run start:dev

# Prisma setup
npx prisma init

# Generate module auth
nest g module auth

# Greate controller users
nest g controller auth/users

# create service prisma
nest g service prisma 