#!/bin/bash

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_dv4mini.desktop /home/pi
sed -i "4c DV4mini=ON" /home/pi/status.ini
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dv4mini.sh'" /home/pi/Abrir_dv4mini.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_DV4MINI_ON.png" /home/pi/Abrir_dv4mini.desktop
sed -i "10c Name[es_ES]=Cerrar DV4mini" /home/pi/Abrir_dv4mini.desktop
sed -i "4c DV4mini=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_dv4mini.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_dv4mini.desktop

cd /home/pi/dv4mini
mono dv4mini.exe
