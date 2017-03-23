#!/bin/sh -e

sudo apt-get update
sudo apt-get -y install git
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
sudo apt-get -y install maven
sudo add-apt-repository ppa:chris-lea/redis-server -y
sudo apt-get install -y redis-server
sudo apt-get install -y nginx

git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
mv apps-platform-acceleration-removing-instance-specific-state-code lb
sudo chown -R vagrant lb
cd lb
nohup nginx -p support -c nginx.conf &

git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
mv apps-platform-acceleration-removing-instance-specific-state-code instance-1
sudo chown -R vagrant instance-1

git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
mv apps-platform-acceleration-removing-instance-specific-state-code instance-2
sudo chown -R vagrant instance-2
