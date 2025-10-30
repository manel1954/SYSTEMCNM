#!/bin/bash
sudo su | ps aux | grep dv4mini.exe | grep -v grep | awk '{print $2}' | xargs kill
sudo killall -9 dv_serial
sudo killall -9 python
SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_dv4mini.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dv4mini.sh'" /home/pi/Abrir_dv4mini.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_DV4MINI_OFF.png" /home/pi/Abrir_dv4mini.desktop
sed -i "10c Name[es_ES]=Abrir DV4mini" /home/pi/Abrir_dv4mini.desktop
sed -i "4c DV4mini=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_dv4mini.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_dv4mini.desktop
