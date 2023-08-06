# Используйте базовый образ PHP, который включает инструменты, такие как git и unzip, необходимые для установки Composer.
FROM php:latest

# Установите Composer в контейнер.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Установите дополнительные пакеты, необходимые для запуска Laravel.
RUN apt-get update && apt-get install -y libpng-dev zip unzip

# Создайте директорию приложения Laravel.
WORKDIR /var/www/html

# Копируйте файлы Laravel приложения в контейнер.
COPY ./app .

# Установите зависимости Laravel.
RUN composer install

# Копируйте файл .env.example в файл .env.
RUN cp .env.example .env

# Генерируйте ключ приложения Laravel.
RUN php artisan key:generate

