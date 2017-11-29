#!/usr/bin/bash

LOGDIR=/vagrant/logfile
echo 'Allow PasswordAuthentication' >> $LOGDIR
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo 'end script execution' >> $LOGDIR
