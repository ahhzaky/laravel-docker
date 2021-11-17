FROM ubuntu:webserver

WORKDIR /laravel-app

# installa composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install php 8
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install php8.0

# jalankan apache
RUN /etc/init.d/apache2 start

# copy file dari komputer ke container
COPY . /laravel-app

#  expose ke port 8000
EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0","--port=8000"]

