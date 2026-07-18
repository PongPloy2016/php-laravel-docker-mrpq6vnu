FROM richarvey/nginx-php-fpm:3.1.6

# Allow composer to run as root (must set BEFORE COPY so it's available)
ENV COMPOSER_ALLOW_SUPERUSER 1

# Copy source code to web root
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Run composer install at build time (--no-scripts skips artisan commands that need .env)
# --optimize-autoloader already generates optimized autoload files, no need for separate dump-autoload
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts \
    && test -f /var/www/html/vendor/autoload.php \
    && echo "vendor/autoload.php OK"

CMD ["/start.sh"]
