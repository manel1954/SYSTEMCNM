#!/bin/bash

sudo pkill -f qt_Callsign
cd /home/pi/MMDVMHost

var=$(tail -2 MMDVM-2022-12-30.log)

#var=$(echo "$var" | tr -d '[[:space:]]')

var2=`expr substr $var 38 16`
var1=`expr substr $var 1 1`




echo "var1 = $var1"
echo "var2 = $var2"
if [ "$var1" = "D" ];then

sudo sed -i "1c $var2" /home/pi/MMDVMHost/HOLA.txt
#xterm -geometry 7x2+652+134 -bg black -fg white -fa ‘verdana’ -fs 19x -T ACTUALIZANDO_IMAGEN -e tail -f /home/pi/MMDVMHost/HOLA.txt
else
sudo sed -i "1c NOCALL" /home/pi/MMDVMHost/HOLA.txt
#xterm -geometry 7x2+652+134 -bg black -fg white -fa ‘verdana’ -fs 19x -T ACTUALIZANDO_IMAGEN -e tail -f /home/pi/MMDVMHost/HOLA.txt

fi
cd /home/pi/SYSTEM
./qt_Callsign