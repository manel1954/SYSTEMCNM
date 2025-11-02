#!/bin/bash

cd /home/pi/Desktop
sudo rm *.desktop
# recupera los iconos que se han borrado y se han convertido en icono de un libro 
cp /home/pi/SYSTEM/Desktop/*.desktop /home/pi/Desktop
sudo chmod 777 -R /home/pi/Desktop

cp /home/pi/desktop-items-0.conf /home/pi/pcmanfm/LXDE/

sudo chmod 777 /home/pi/pcmanfm/LXDE/desktop-items-0.conf 

cd /home/pi/SYSTEM/qt/
./qt_colocar_iconos                         

sudo rm -r ~/.cache/sessions/

