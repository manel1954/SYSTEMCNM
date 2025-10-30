#!/bin/bash
clear
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

                        echo "\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "*********************************************************************************"
                        echo "*********************************************************************************"
                        echo "                                REINSTALANDO HBLINK                              "
                        echo "*********************************************************************************"
                        echo "*********************************************************************************"

sudo rm -R /opt/HBlink3
sudo rm -R /opt/HBmonitor


echo "${MARRON}"
sudo apt update -y
sudo apt install python3-distutils

cd /opt/
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py

echo "${CIAN}"
sudo apt install python3-twisted
echo "${BLANCO}"
sudo apt install python3-bitarray
sudo apt install python3-dev
sudo git clone https://github.com/lz5pn/HBlink3
sudo mv /opt/HBlink3/ /opt/backup/
sudo mv /opt/backup/HBlink3/ /opt/
sudo mv /opt/backup/HBmonitor/ /opt/
sudo mv /opt/backup/dmr_utils3/ /opt/
sudo rm -r /opt/backup/

sleep2
cd /opt/dmr_utils3
sudo chmod +x install.sh

echo "${VERDE}"
sudo ./install.sh
sudo /usr/bin/python3 -m pip install --upgrade pip
sudo pip install --upgrade dmr_utils3

sleep 2
cd /opt/HBlink3
sudo cp hblink-SAMPLE.cfg hblink.cfg
sudo cp rules-SAMPLE.py rules.py

#Autostart HBLink:
sudo cp /home/pi/SYSTEM/hblink.service /lib/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable hblink

#Instalar Parrot para  Echotest:
sudo chmod +x playback.py

#Crear directorio  /var/log/hblink si no está creado
sudo mkdir /var/log/hblink

#Crear servicio para el parrot /lib/systemd/system/parrot.service 
sudo cp /home/pi/SYSTEM/parrot.service /lib/systemd/system/

sudo systemctl enable parrot.service
sudo systemctl start parrot.service
#sudo systemctl status parrot.service

#Configurar HBlink
#sudo nano /opt/HBlink3/hblink.cfg
#sudo nano /opt/HBlink3/rules.py

#Test de configuración:
#python3 /opt/HBlink3/bridge.py

#Si es ok salir con  "ctrl-c" y start los servicios

sudo systemctl start hblink
#sudo systemctl status hblink

echo "${CIAN}"
sleep 2
#Instalar web monitor para HBLink.
cd /opt/HBmonitor
sudo chmod +x install.sh
sudo ./install.sh
sudo cp config_SAMPLE.py config.py
#sudo nano /opt/HBmonitor/config.py

sleep 2
sudo cp /home/pi/SYSTEM/hblink.cfg /opt/HBlink3/
sudo cp /home/pi/SYSTEM/rules.py /opt/HBlink3/
sudo cp /home/pi/SYSTEM/playback.cfg /opt/HBlink3/
sudo cp /home/pi/SYSTEM/index_template.html /opt/HBmonitor/
sudo cp /home/pi/SYSTEM/config.py /opt/HBmonitor/
sudo cp /home/pi/SYSTEM/monitor.py /opt/HBmonitor/
sudo cp /home/pi/SYSTEM/bridge_table.html /opt/HBmonitor/templates/
sudo cp /home/pi/SYSTEM/hblink_table.html /opt/HBmonitor/templates/
sudo cp /home/pi/SYSTEM/lastheard.html /opt/HBmonitor/templates/

                        # modificacion 26-01-2022
                        #cd /home/pi/.local
                        #mv index_template.html_00 /opt/HBmonitor
                        #mv index_template.html_01 /opt/HBmonitor
                        #mv index_template.html_02 /opt/HBmonitor
                        #mv index_template.html_03 /opt/HBmonitor
                        #mv index_template.html_04 /opt/HBmonitor

                        #mv monitor.py_00 /opt/HBmonitor
                        #mv monitor.py_01 /opt/HBmonitor
                        #mv monitor.py_02 /opt/HBmonitor
                        #mv monitor.py_03 /opt/HBmonitor
                        #mv monitor.py_04 /opt/HBmonitor

#Start monitor service:
sudo cp utils/hbmon.service /lib/systemd/system/
sudo systemctl enable hbmon
sudo systemctl start hbmon
#sudo systemctl status hbmon


sudo systemctl restart hbmon
sudo systemctl restart hblink

clear
echo "${AMARILLO}"
echo "\v\v\v\v\v\v"

echo "*********************************************************************************"
echo "*********************************************************************************"
echo "*******************  LA REINSTALACIÓN HA FINALIZADO CON EXITO  ******************"
echo "*********************************************************************************"
echo "*********************************************************************************"
sed -i "14c HBLINK_INSTALADO=ON" /home/pi/info.ini 
sed -i "22c 22" /home/pi/info.ini
sed -i "23c 23" /home/pi/info.ini
sed -i "24c 24" /home/pi/info.ini
sed -i "25c 25" /home/pi/info.ini
sed -i "26c 26" /home/pi/info.ini
sed -i "27c 27" /home/pi/info.ini
sed -i "28c 28" /home/pi/info.ini
sed -i "29c 29" /home/pi/info.ini
sed -i "30c 30" /home/pi/info.ini
sleep 5
exit


