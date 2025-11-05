# Use the official PHP + Apache image
FROM php:8.1-apache

# Enable common PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    a2enmod rewrite

# Remove the default Apache web files
RUN rm -rf /var/www/html/*

# Set working directory
WORKDIR /var/www/html

# Copy your project files into the container
COPY . /var/www/html/

# (Optional) Copy a custom Apache config if you have one
# COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
