FROM php:8.2-cli

WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y \
    libzip-dev libonig-dev \
    git \
    unzip \
    libjpeg-dev \
    libxpm-dev \
    libwebp-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    zlib1g-dev \
    libicu-dev \
    jpegoptim \
    g++ \
    libxrender1 \
    libfontconfig \
    nano \
    cron

RUN docker-php-ext-install pdo mbstring pdo_mysql

COPY . .

RUN composer install

EXPOSE 8000
