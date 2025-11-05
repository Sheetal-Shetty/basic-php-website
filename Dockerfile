# Use an official PHP image with Apache
FROM php:8.2-apache

# Set working directory in the container
WORKDIR /var/www/html

# Copy the website files into the container
COPY . /var/www/html

# Enable Apache mod_rewrite (if your site uses URL rewriting)
RUN a2enmod rewrite

# Adjust Apache config to allow .htaccess overrides (if needed)
RUN sed -i '/<Directory \/var\/www\/html>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Set appropriate permissions (optional, adjust as necessary)
RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type f -exec chmod 644 {} \; \
    && find /var/www/html -type d -exec chmod 755 {} \;

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
