FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
	libpng-dev \
	zip \
	unzip

RUN docker-php-ext-install pdo pdo_mysql gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer self-update

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/html

#CMD bash -c "composer install && php artisan key:generate"