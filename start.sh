#!/bin/sh

hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000&

service nginx start

composer install

tail -f /var/log/hhvm/error.log
