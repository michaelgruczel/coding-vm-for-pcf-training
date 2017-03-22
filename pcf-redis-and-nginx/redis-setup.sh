#!/bin/sh -e

sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install default-jdk
sudo apt-get -y install maven
git clone git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
mv apps-platform-acceleration-removing-instance-specific-state-code apps-platform-acceleration-removing-instance-specific-state-code-one
git clone git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
mv apps-platform-acceleration-removing-instance-specific-state-code apps-platform-acceleration-removing-instance-specific-state-code-two
sudo chown -R vagrant apps-platform-acceleration-removing-instance-specific-state-code-one
sudo chown -R vagrant apps-platform-acceleration-removing-instance-specific-state-code-two
sudo add-apt-repository ppa:chris-lea/redis-server -y
sudo apt-get install -y redis-server
sudo apt-get install -y nginx
git clone https://github.com/platform-acceleration-lab/apps-platform-acceleration-removing-instance-specific-state-code.git
sudo chown -R vagrant apps-platform-acceleration-removing-instance-specific-state-code
nohub nginx -p support -c apps-platform-acceleration-removing-instance-specific-state-code/support/nginx.conf &

cd /home/vagrant/apps-platform-acceleration-removing-instance-specific-state-code-one
nohup mvn -Dmaven.tomcat.port=8080 -DinstanceNumber=1 tomcat7:run-war &

cd /home/vagrant/apps-platform-acceleration-removing-instance-specific-state-code-two
nohup mvn -Dmaven.tomcat.port=8080 -DinstanceNumber=1 tomcat7:run-war &
