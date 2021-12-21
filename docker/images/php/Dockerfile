FROM php:8.0-fpm

RUN apt-get update && apt-get install git libzip-dev -y

RUN pecl install xdebug apcu opcache \
    && docker-php-ext-install mysqli pdo pdo_mysql zip \
    && docker-php-ext-enable xdebug apcu opcache zip

WORKDIR /usr
RUN curl "https://getcomposer.org/installer" -o /usr/composer-setup.phar \
    && php /usr/composer-setup.phar \
    && cp /usr/composer.phar /usr/bin/composer

WORKDIR /var/www/html