#!/bin/bash

cd /home/pi
sudo rm -R /home/pi/versionSYSTEM
git clone http://github.com/manel1954/versionSYSTEM

nueva_version=$(awk "NR==1" /home/pi/versionSYSTEM/versionSYSTEM.txt)

version_actual=$(awk "NR==101" /home/pi/status.ini)

if [ "$version_actual" = "$nueva_version" ];then
echo "no hace nada"
else
cd /home/pi/SYSTEM/qt
./qt_comprueba_version 
fi