#!/bin/bash
SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_ambe_server.desktop /home/pi
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/SYSTEM; sh ejecutar_ambe_server.sh'" /home/pi/Abrir_ambe_server.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_AMBE_OFF.png" /home/pi/Abrir_ambe_server.desktop
sed -i "10c Name[es_ES]=Abrir AMBE SERVER" /home/pi/Abrir_ambe_server.desktop
sed -i "11c AMBE_SERVER=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_ambe_server.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ambe_server.desktop

sudo killall -9 AMBEserver

				
						
						