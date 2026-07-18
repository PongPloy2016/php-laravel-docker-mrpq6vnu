FROM richarvey/nginx-php-fpm:3.1.6

# Allow composer to run as root 
ENV COMPOSER_ALLOW_SUPERUSER 1

# Copy Source code และตั้ง owner เป็น nginx ทันที
COPY --chown=nginx:nginx . /var/www/html

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

# รัน composer install ในฐานะ root เพื่อหลีกเลี่ยงสิทธิ์โฟลเดอร์เขียน cache
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts --ignore-platform-reqs \
    && test -f /var/www/html/vendor/autoload.php \
    && echo "vendor/autoload.php OK"

# จัดการสิทธิ์โฟลเดอร์สำหรับ Laravel
RUN chown -R nginx:nginx /var/www/html \
    && chmod -R 775 /var/www/html/storage \
    && chmod -R 775 /var/www/html/bootstrap/cache

CMD ["/start.sh"]
