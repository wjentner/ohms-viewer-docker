FROM php:8.2-apache

LABEL org.opencontainers.image.authors="Wolfgang Jentner <wolfgang.jentner@gmail.com>"

RUN apt update && apt install wget && apt-get clean

ARG OHMS_VERSION=3.9.3

RUN wget https://github.com/uklibraries/ohms-viewer/archive/refs/tags/v${OHMS_VERSION}.tar.gz -O /tmp/ohms.tar.gz

RUN tar -xvf /tmp/ohms.tar.gz -C /tmp

RUN rm /tmp/ohms.tar.gz

RUN mv /tmp/ohms-viewer-${OHMS_VERSION}/* /var/www/html

RUN mkdir -v /usr/local/share/cachefiles

# adjust config
RUN cp /var/www/html/config/config.template.ini /var/www/html/config/config.ini

RUN sed -i 's|tmpDir =|tmpDir = /usr/local/share/cachefiles|g' /var/www/html/config/config.ini

RUN cat /var/www/html/config/config.ini

RUN chown -R www-data:www-data /var/www/html
