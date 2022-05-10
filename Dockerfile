FROM php:8-fpm

# Configurar directorio de trabajo
WORKDIR /var/www

# Install dependencies
RUN apt-get update \
    # gd
    && apt-get install zip -y --no-install-recommends build-essential nginx \
    # && apt-get install -y --no-install-recommends build-essential  openssl nginx libfreetype6-dev libjpeg-dev libpng-dev libwebp-dev zlib1g-dev libzip-dev gcc g++ make vim unzip curl git jpegoptim optipng pngquant gifsicle locales libonig-dev \
    # && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    # && docker-php-ext-install gd \
    # gmp
    # && apt-get install -y --no-install-recommends libgmp-dev \
    # && docker-php-ext-install gmp \
    # pdo_mysql
    && docker-php-ext-install pdo_mysql \
    # pdo
    && docker-php-ext-install pdo 
    # opcache
    # && docker-php-ext-enable opcache \
    # zip
    # && docker-php-ext-install zip exif pcntl \
    # && apt-get autoclean -y \
    # && rm -rf /var/lib/apt/lists/* \
    # && rm -rf /tmp/pear/

# Copy existing application directory contents
COPY . /var/www
#COPY .env.pro /var/www/.env
#Copiar configuracion php
COPY ./docker/php/local.ini /usr/local/etc/php/php.ini
#Copiar configuracion nginx
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
#Copiar archivo sh para iniciar php y servidor nginx al terminar de crear el contenedor
COPY ./docker/deploy/post_deploy.sh /bin/post_deploy.sh

#Permisos sobre el proyecto
RUN chmod +rwx /var/www
RUN chmod -R 777 /var/www
RUN chmod -R 777 /var/www/storage/logs/

# setup composer and laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --prefer-dist --working-dir="/var/www"
# RUN composer require phpoffice/phpspreadsheet:1.18.0 --working-dir="/var/www"
RUN composer dump-autoload --working-dir="/var/www"
# RUN composer update --working-dir="/var/www"
# RUN php artisan cache:clear
# RUN php artisan config:clear
# RUN php artisan route:clear
RUN php artisan optimize

EXPOSE 80

RUN ["chmod", "+x", "/bin/post_deploy.sh"]
CMD [ "sh", "/bin/post_deploy.sh" ]

