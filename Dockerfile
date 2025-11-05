# Use an official PHP image with Apache
# Use official PHP with Apache image
FROM php:8.1-apache

# Optional: enable mysqli (if you use MySQL) or other extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && a2enmod rewrite

# Set working directory to Apache document root
WORKDIR /var/www/html

# Copy your code into the container
COPY . /var/www/html/

# Fix permissions (optional, depending on your host setup)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
