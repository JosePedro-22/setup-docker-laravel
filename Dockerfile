FROM php:8.2-fpm
# VOLUME . /var/www

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    unzip \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxpm-dev \
    zlib1g-dev \
    libpq-dev \
    libzip-dev \
    telnet

RUN docker-php-ext-install \
    zip \
    gd \
    pdo \
    pdo_pgsql \
    pgsql \
    pdo_mysql \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql

# RUN pecl install -o -f xdebug-3.1.5 \
#     && docker-php-ext-enable xdebug

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN chown -R www-data:www-data /var/www
