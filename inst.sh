#!/usr/bin/bash

DIR=/vagrant/logfile
echo '**************start script**************' > $DIR
sudo su
echo '**************updating packages**************' >> $DIR
yum -y update >> $DIR
echo '**************installing Apache**************' >> $DIR
yum -y install httpd >> $DIR
echo '**************checking installation**************' >> $DIR
httpd -v >> $DIR
service httpd start >> $DIR
service httpd status >> $DIR
service httpd stop >> $DIR
