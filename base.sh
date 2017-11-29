#!/usr/bin/bash

# Base file for host and slave virtual machines
# Path to log file
LOGDIR=/vagrant/logfile

# Starting scirpt and log steps
touch $LOGDIR
echo "start script ${SSH_CLIENT}" >> $LOGDIR
echo 'update packages' >> $LOGDIR
###
yum -y update
###
echo 'install Apache' >> $LOGDIR
###
yum -y install httpd
###
echo "Apache was installed: $(httpd -v)" >> $LOGDIR
echo 'Start Apache' >> $LOGDIR
###
service httpd start
###
echo 'install Java and add it to PATH' >> $LOGDIR
###
yum -y install java-1.8.0-openjdk.x86_64
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile
###
echo "Java was installed: $(java -version)" >> $LOGDIR
echo "Java was added to PATH: ${JAVA_HOME} ${JRE_HOME}" >> $LOGDIR
