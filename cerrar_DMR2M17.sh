#!/bin/bash

cd /home/pi/Desktop
cp ABRIR_DMR2M17.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/SYSTEM; sudo sh ejecutar_DMR2M17.sh'" /home/pi/ABRIR_DMR2M17.desktop
sed -i "7c Icon=/home/pi/SYSTEM/ICO_DMR2M17_OFF.png" /home/pi/ABRIR_DMR2M17.desktop
sed -i "4c Name[es_ES]=Abrir DMR2M17" /home/pi/ABRIR_DMR2M17.desktop
sed -i "21c DMR2M17=OFF" /home/pi/status.ini
cd /home/pi
cp ABRIR_DMR2M17.desktop /home/pi/Desktop

sudo rm /home/pi/ABRIR_DMR2M17.desktop

sudo killall -9 DMR2M17
sudo killall -9 MMDVMDMR2M17




  