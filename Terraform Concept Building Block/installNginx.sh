#!/bin/bash

# sleep until the insatance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done

# install nginx
apt-get update
apt-get -y install nginx

# make sure nginx is started
service nginx start
