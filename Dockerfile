# FROM php:7.4-apache
# RUN apt-get update -y
# RUN rm -rf /var/www/html/*
# COPY . /var/www/html/
# EXPOSE 80
# CMD ["apache2-foreground"]


FROM ubuntu:latest
RUN apt-get update -y && apt-get install -y apache2
RUN rm -rf /var/www/html/*
COPY . /var/www/html/
EXPOSE 80
ENTRYPOINT apachectl -D FOREGROUND
