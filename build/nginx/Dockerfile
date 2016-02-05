FROM ubuntu:latest

RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN chown -R www-data:www-data /var/lib/nginx

VOLUME /vagrant_data
WORKDIR /etc/nginx
COPY drawclash /etc/nginx/sites-enabled/drawclash
CMD ["nginx"]

EXPOSE 80 443
