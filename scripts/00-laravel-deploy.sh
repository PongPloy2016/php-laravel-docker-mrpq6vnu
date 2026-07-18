#!/usr/bin/env bash
set -e  # Stop immediately if any command fails

echo "=== Laravel Deploy Script ==="
echo "Verifying vendor/autoload.php exists..."
if [ ! -f /var/www/html/vendor/autoload.php ]; then
  echo "vendor/autoload.php not found! Running composer install..."
  composer install --no-dev --optimize-autoloader --no-interaction --working-dir=/var/www/html
fi

echo "Discovering packages..."
php artisan package:discover --ansi

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force

echo "Seeding initial settings data..."
php artisan db:seed --class=SettingsSeeder --force

echo "Creating storage symlink..."
php artisan storage:link || true

echo "Optimizing..."
php artisan optimize

echo "=== Deploy complete ==="
