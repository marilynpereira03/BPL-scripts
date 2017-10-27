#!/bin/bash

sudo su
echo -e "Updating\n"
apt-get update
echo -e "Install ntp\n"
apt-get install ntp -y
echo -e "NTP status ?\n"
service ntp status
ntpq -p
#check whether ntp is enabled
echo -e "Is NTP enabled ?\n"	
systemctl is-enabled ntp
#To be more cautious, enable NTP
echo -e "Enabling NTP \n"
systemctl enable ntp
#Check the available time servers
echo -e "Check the available time servers\n"
grep "^pool" /etc/ntp.conf
#gets the available time servers
echo -e "Gets the available time servers\n"
ntpq -pcrv
#You can see the specific system time and time config by using the timedatectl command
timedatectl

#Check whether ntp is working or not ?
echo -e "Install ntpstat \n"
sudo apt-get install ntpstat
ntpstat
#Check exit status of NTP if 0 clock is synchronized
echo -e "Exit status of NTP \n"
echo $?

echo -e "Do your changes \n"

