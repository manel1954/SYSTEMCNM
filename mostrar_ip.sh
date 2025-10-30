#!/bin/bash
sudo ifconfig | grep "inet" > /home/pi/.local/ip_raspberry.txt
$ip('awk "NR==1{print;exit}" /home/pi/.local/ip_raspberry.txt');
#$ip = substr($ip, 14, 13);


#printf "Script to extract a substring!\n\n"

#numbers='one_two_three_four_five'
substring=${ip:14:30}

echo "full string: $ip\n"
printf "substring: $substring\n"

read a