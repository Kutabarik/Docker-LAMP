FROM php:7.4-fpm

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#RUN php composer-setup.php
#RUN php -r "unlink('composer-setup.php');"
#RUN mv composer.phar /usr/local/bin/composer

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& php /usr/local/bin/composer self-update \

	RUN apt-get update && apt-get install -y \
	libpng-dev \
	zip \
	unzip

RUN docker-php-ext-install pdo pdo_mysql gd

WORKDIR /var/www/html

COPY . .

RUN composer install

RUN cp .env.example .env

RUN php artisan key:generate
