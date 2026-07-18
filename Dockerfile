FROM richarvey/nginx-php-fpm:3.1.6

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# [แก้ไข]: เพิ่ม --chown=nginx:nginx เพื่อให้ User nginx มีสิทธิ์อ่านเขียนไฟล์ที่ก๊อปปี้เข้าไป
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

# [แก้ไข]: สลับมาใช้ User root ก่อนชั่วคราว เพื่อสั่งเปลี่ยนสิทธิ์โฟลเดอร์ให้ชัวร์
USER root
RUN chown -R nginx:nginx /var/www/html

# [แก้ไข]: สลับกลับเป็น User nginx เพื่อรัน composer install แบบปลอดภัย
USER nginx

# [แก้ไข]: เพิ่ม --ignore-platform-reqs ป้องกันกรณี Extension บน Render ไม่ตรงกับ composer.json
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts --ignore-platform-reqs \
    && test -f /var/www/html/vendor/autoload.php \
    && echo "vendor/autoload.php OK"

# [แก้ไข]: สลับกลับเป็น root เพื่อให้ Script /start.sh ของ Image รันระบบตอนท้ายได้สมบูรณ์
USER root

CMD ["/start.sh"]
