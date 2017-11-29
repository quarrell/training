#!/usr/bin/bash

# Provision file for host virtual machine
# Define variables
KEY=/root/.ssh/id_rsa
LOGDIR=/vagrant/logfile
JARDIR=/home/vagrant/slave.jar
SLAVEHOST=vagrant@192.168.50.52
PASS="vagrant"
###
echo 'install wget and sshpass' >> $LOGDIR
###
yum -y install wget
yum install -y sshpass
###
echo 'install jenkins and start jenkins service' >> $LOGDIR
###
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum -y install jenkins
systemctl start jenkins.service
###
echo "Jenkins status: $(systemctl status jenkins.service)" >> $LOGDIR
echo 'Download slave.jar' >> $LOGDIR
###
wget -O $JARDIR localhost:8080/jnlpJars/slave.jar
###
echo "slave.jar is located: $(ls -l ${JARDIR})" >> $LOGDIR
echo 'Generate ssh keys and connect with slave' >> $LOGDIR
ssh-keygen -t rsa -N "" -f $KEY
ssh-keyscan -t rsa 192.168.50.52 >> /root/.ssh/known_hosts
sshpass -p $PASS ssh-copy-id -i $KEY'.pub' $SLAVEHOST
sshpass -p $PASS scp $JARDIR $SLAVEHOST:/vagrant

#To run slave uncomment next lines
# sshpass ssh $SLAVEHOST java -jar $JARDIR/slave.jar

echo 'end script execution' >> $LOGDIR
