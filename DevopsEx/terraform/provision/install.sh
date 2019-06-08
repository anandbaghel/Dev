#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install htppd
sudo yum update -y
sudo yum install -y httpd

# make sure httpd is started
sudo service httpd start
sudo chkconfig on
