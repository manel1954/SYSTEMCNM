#!/bin/bash
sudo killall -9 MMDVMFUSION
sudo killall -9 YSF2DMR
SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_YSF2DMR.desktop /home/pi
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version/;sudo sh ejecutar_YSF2DMR.sh'" /home/pi/Abrir_YSF2DMR.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_YSF2DMR_OFF.png" /home/pi/Abrir_YSF2DMR.desktop
sed -i "10c Name[es_ES]=Abrir YSF2DMR" /home/pi/Abrir_YSF2DMR.desktop
sed -i "14c YSF2DMR=OFF" /home/pi/status.ini
cd /home/pi

sudo cp Abrir_YSF2DMR.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_YSF2DMR.desktop
