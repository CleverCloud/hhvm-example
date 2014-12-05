#!/bin/sh

hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000&

service nginx start

composer install

echo "App running on port 8080"

tail -f /var/log/hhvm/error.log
