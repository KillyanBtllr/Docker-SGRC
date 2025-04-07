FROM php:7.4-apache

RUN a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN pecl install redis && docker-php-ext-enable redis

RUN apt-get update && apt-get install -y netcat

WORKDIR /var/www/html

COPY docker/web/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apachectl", "-D", "FOREGROUND"]