#!/bin/bash

cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_ESPECIAL_OFF.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_ESPECIAL.desktop

sudo killall -9 MMDVMESPECIAL