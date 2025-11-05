# FROM php:8.2-apache
# ARG DEBIAN_FRONTEND=noninteractive
# ENV APACHE_DOCUMENT_ROOT=/var/www/html/phpapp
# #RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//https:\/\/archive.ubuntu.com\/ubuntu\//g' /etc/apt/sources.list
# #RUN sed -i 's/http:\/\/archive.ubuntu.com\//http:\/\/us.archive.ubuntu.com\//g' /etc/apt/sources.list
# RUN apt-get update -y && apt-get install -y apache2
# RUN mkdir /var/www/html/phpapp
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
#         sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
# WORKDIR /var/www/html/phpapp
# COPY . .
# #ADD . /var/www/html/
# EXPOSE 80
# ENTRYPOINT apachectl -D FOREGROUND

FROM php:8.2-apache

# Install necessary PHP extensions (example: MySQLi, PDO, PDO_MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache rewrite module for clean URLs (if needed)
RUN a2enmod rewrite

# Set the working directory inside the container
WORKDIR /var/www/html/php

# Copy the entire application code into the container's working directory
COPY . /var/www/html/php

# Expose port 80 (default HTTP port)
EXPOSE 80

# Command to start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
