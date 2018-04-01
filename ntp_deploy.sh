#!/bin/bash

sudo apt-get update -y > /dev/null
sudo apt-get install -y ntp > /dev/null
#######################################
sed -i '/.ubuntu.pool.ntp.org/d' etc/ntp.conf
sed -i 'ua.pool.ntp.ntp.prg/d' /etc/ntp.conf
sed -i "18i pool ua.pool.ntp.org iburst" /etc/ntp.conf
##################################################
service ntp restart
cp /etc/ntp.conf /etc/ntp.conf.back-up
cron="*/1 * * * * pwd /ntp_verify.sh"
(crontab -l 2>/dev/null | grep -v -F "$cron" ; echo "$cron")
cron - loop_file="etc/crontab"
