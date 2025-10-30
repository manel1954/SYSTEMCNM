#!/bin/bash
sudo killall -9 svxlink
SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_svxlink.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh ejecutar_svxlink.sh'" /home/pi/Abrir_svxlink.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_SVXLINK_OFF.png" /home/pi/Abrir_svxlink.desktop
sed -i "10c Name[es_ES]=Abrir SVXLINK" /home/pi/Abrir_svxlink.desktop
sed -i "8c SVXLINK=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_svxlink.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_svxlink.desktop



