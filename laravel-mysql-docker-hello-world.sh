#!/usr/bin/env sh

# Check for input with the project name
if [ -z "$1" ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

proj_name="$1"

# Kill processes and containers on ports 80 and 3306
for PORT in 80 3306; do
  sudo lsof -ti :$PORT | xargs -r sudo kill -9
  docker ps --format "{{.ID}} {{.Ports}}" | grep ":$PORT" | awk '{print $1}' | xargs -r docker stop
done

# Run Laravel project setup inside Docker
docker run --rm \
  -u "$(id -u):$(id -g)" \
  -v "$(pwd):/var/www/html" \
  -w /var/www/html \
  laravelsail/php84-composer:latest \
  bash -c " \
    composer create-project --prefer-dist laravel/laravel $proj_name && \
    cd $proj_name && \
    composer require laravel/sail --dev && \
    php artisan sail:install && \
    php artisan sail:publish \
  "

# Start Sail and run migration
cd "$proj_name" || exit 1
cd docker
rm -rf 8.0 8.1 8.2 8.3 mariadb pgsql
cd ..
./vendor/bin/sail up -d
echo "Waiting 15 seconds for MySQL to be ready to run ./vendor/bin/sail artisan migrate"
sleep 15
./vendor/bin/sail artisan migrate
