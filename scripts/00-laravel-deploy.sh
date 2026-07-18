#!/usr/bin/env bash

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
php artisan migrate --force || echo "⚠️ Migration failed, but continuing..."

echo "Seeding initial settings data..."
php artisan db:seed --class=SettingsSeeder --force || echo "⚠️ Seeding failed, but continuing..."

echo "Creating storage symlink..."
php artisan storage:link || true

echo "Optimizing..."
php artisan optimize

if [ -f /var/www/html/database/quiz_db.sql ]; then
  echo "Found database/quiz_db.sql. Importing database dump..."
  php artisan db:import-dump /var/www/html/database/quiz_db.sql || echo "⚠️ Import failed, but continuing..."
fi

echo "Clearing caches to ensure dynamic environment variables and fresh views are used..."
php artisan view:clear
php artisan config:clear
php artisan route:clear
php artisan cache:clear

echo "=== Deploy complete ==="
