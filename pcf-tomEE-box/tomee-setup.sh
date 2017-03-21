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
sudo chown -R vagrant:vagrant apache-tomee-webprofile-1.7.4/
cd apache-tomee-webprofile-1.7.4/bin
nohup ./startup.sh &
sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install default-jdk
sudo apt-get -y install maven
cd ..
cd ..
git clone https://github.com/platform-acceleration-lab/apps-movie-fun-code.git
sudo chown -R vagrant  apps-movie-fun-code
cd  apps-movie-fun-code/
cp /mnt/bootstrap/pom.xml /home/vagrant/apps-movie-fun-code/pom.xml
mvn clean package -DskipTests -Dmaven.test.skip=true
cp target/moviefun.war /home/vagrant/apache-tomee-webprofile-1.7.4/webapps
