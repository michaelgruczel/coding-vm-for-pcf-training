#!/bin/sh -e

wget http://repo.maven.apache.org/maven2/org/apache/openejb/apache-tomee/1.7.4/apache-tomee-1.7.4-webprofile.zip
sudo apt-get install -y unzip
unzip apache-tomee-1.7.4-webprofile.zip
sudo apt-get update
sudo apt-get install -y openjdk-7-jre
## todo JBOSS_HOME/standalone/configuration/standalone.xml allow from outside
#<interface name="management">
#       <any-ipv4-address/>
#	   </interface>
#    <interface name="public">
#       <any-ipv4-address/>
#    </interface>
#
#you can simply package your application as a standard WAR file and copy it to the [TomEE]/webapps folder, or as an EAR file and copy it to the [TomEE]/apps folder.
sudo wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jre6.jar
sudo chown -R vagrant:vagrant apache-tomee-webprofile-1.7.4/
cd apache-tomee-webprofile-1.7.4/bin
nohup ./startup.sh &

