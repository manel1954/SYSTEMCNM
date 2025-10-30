#!/bin/bash

cd /home/pi/Desktop
sudo rm *.desktop
# recupera los iconos que se han borrado y se han convertido en icono de un libro 
cp /home/pi/SYSTEM/Desktop/*.desktop /home/pi/Desktop
sudo chmod 777 -R /home/pi/Desktop

# cp /home/pi/icons.screen0-1904x1017.rc /home/pi/.config/xfce4/desktop
# sudo chmod 777 -R /home/pi/.config/xfce4/desktop

cinnamon --replace &

cd /home/pi/SYSTEM/qt/
./qt_colocar_iconos                         

sudo rm -r ~/.cache/sessions/

