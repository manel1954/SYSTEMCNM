#!/bin/bash

cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sh ejecutar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_BM_OFF.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=Abrir BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_MMDVMBM.desktop

sudo killall -9 MMDVMBM


