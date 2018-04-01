#!/bin/bash
ps auxw | grep ntpd | grep -v grep > /dev/null
###
if [$? !=0];
then
echo "Ntp не работает"
echo "Ntp не работает" >> /var/mail/root
servise ntp start
fi;
######
diff etc/ntp.conf /etc/ntp.conf.back-up > /dev/null
if [$? == 1];
then
echo "/etc/ntp.conf erro 404." >> /var/mail/root
######
diff -u0 /etc/ntp.conf.back-up /etc/ntp.conf >> /var/mail/root
echo "Reboot"
cat /etc/ntp.conf.back-up > /etc/ntp.conf
service ntp restart > /dev/null
fi;


