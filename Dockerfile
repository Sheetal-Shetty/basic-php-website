# Use official PHP + Apache image
FROM php:8.1-apache

# Enable commonly used PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Remove default Apache HTML files
RUN rm -rf /var/www/html/*

# Copy your site files into the container
COPY . /var/www/html

# Fix file permissions
RUN chown -R www-data:www-data /var/www/html

# Enable .htaccess overrides if needed
RUN sed -i 's!/var/www/html!/var/www/html!g' /etc/apache2/sites-available/000-default.conf && \
    sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Expose Apache port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
