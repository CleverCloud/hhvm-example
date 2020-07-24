FROM hhvm/hhvm-proxygen:latest

RUN apt-get update -y && apt-get install -y curl
# Install composer
RUN mkdir /opt/composer
RUN curl -sS https://getcomposer.org/installer | hhvm --php -- --install-dir=/opt/composer

RUN rm -rf /var/www
ADD . /var/www
RUN cd /var/www && hhvm /opt/composer/composer.phar install

#ADD . /root
#RUN sudo chmod +x /root/start.sh

#ADD hhvm.hdf /etc/hhvm/server.hdf
#ADD nginx.conf /etc/nginx/sites-available/hack.conf
#RUN sudo ln -s /etc/nginx/sites-available/hack.conf /etc/nginx/sites-enabled/hack.conf

WORKDIR /var/www

EXPOSE 8080
