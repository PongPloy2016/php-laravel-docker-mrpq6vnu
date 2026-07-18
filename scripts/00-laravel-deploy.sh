#!/usr/bin/env bash
echo "Running composer"
composer install --no-dev --working-dir=/var/www/html

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force

echo "Seeding initial data..."
php artisan db:seed --class=SettingsSeeder --force

echo "Creating storage symlink..."
php artisan storage:link || true

echo "Optimizing..."
php artisan optimize
