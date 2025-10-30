#!/bin/bash

cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;sh ejecutar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_RADIO_OFF.png" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Abrir DMO" /home/pi/Abrir_Radio.desktop
sed -i "5c MMDVM=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_Radio.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_Radio.desktop

sudo killall -9 MMDVMHost