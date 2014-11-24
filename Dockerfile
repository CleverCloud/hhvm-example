FROM jolicode/hhvm

RUN apt-get update \
 && apt-get install -y nginx

ADD . /root
RUN chmod +x /root/start.sh

ADD hhvm.hdf /etc/hhvm/server.hdf
ADD nginx.conf /etc/nginx/sites-available/hack.conf
RUN ln -s /etc/nginx/sites-available/hack.conf /etc/nginx/sites-enabled/hack.conf
RUN nginx -t

RUN chown -R www-data:www-data /root
WORKDIR /root

EXPOSE 8080

CMD /root/start.sh
