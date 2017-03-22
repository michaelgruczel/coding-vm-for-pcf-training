#!/bin/sh -e

sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install default-jdk
sudo apt-get -y install maven
sudo add-apt-repository ppa:chris-lea/redis-server -y
sudo apt-get install -y redis-server
sudo apt-get install -y nginx

git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
sudo chown -R vagrant apps-platform-acceleration-removing-instance-specific-state-code
nohup nginx -p support -c apps-platform-acceleration-removing-instance-specific-state-code/support/nginx.conf &
