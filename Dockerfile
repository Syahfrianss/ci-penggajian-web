FROM php:8.3-apache

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite \
 && sed -ri 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

RUN echo "session.save_path=/tmp" > /usr/local/etc/php/conf.d/session.ini

WORKDIR /var/www/html

CMD ["sh", "-c", "mkdir -p assets/photo application/cache application/logs && chown -R www-data:www-data assets/photo application/cache application/logs 2>/dev/null; exec apache2-foreground"]