#!/bin/bash

# sleep until the insatance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done

# install nginx
app-get update
app-get -y install nginx

# make sure nginx is started
service nginx start
