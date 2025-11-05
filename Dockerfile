FROM php:7.4-apache
RUN apt-get update -y
RUN rm -f /var/www/html/index.html
ADD . /var/www/html/
EXPOSE 80
ENTRYPOINT apachectl -D FOREGROUND


# FROM ubuntu:latest
# RUN apt-get update -y && apt-get install -y apache2 && apt-get install libapache2-mod-php -y
# RUN rm -f /var/www/html/index.html
# ADD . /var/www/html/
# EXPOSE 80
# ENTRYPOINT apachectl -D FOREGROUND
