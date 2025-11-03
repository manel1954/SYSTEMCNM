#!/bin/bash

# recupera los iconos que se han borrado y algunos que se han convertido en icono de un libro 
cp -R /home/pi/SYSTEM/Desktop/* /home/pi/Desktop 

#sudo chmod 777 -R /home/pi/Desktop

# reorganiza los iconos
#cp /home/pi/desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE

#sudo chmod 777 /home/pi/pcmanfm/LXDE/desktop-items-0.conf 


cd /home/pi/SYSTEM/qt/
./qt_colocar_iconos                         

sudo rm -r ~/.cache/sessions/

