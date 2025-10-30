#!/bin/bash

sudo killall -9 qt_editor_especial

mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVMESPECIAL.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMESPECIAL.ini)
puerto=`expr substr $mode 15 14`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_ESPECIAL.desktop /home/pi

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMESPECIAL.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_ESPECIAL.desktop

sudo cp /home/pi/RXF_ESPECIAL.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_ESPECIAL.desktop

#Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF                        
sed -i "3c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_ESPECIAL_ON.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Cerrar Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ESPECIAL.desktop

cd /home/pi/MMDVMHost
xterm -geometry 88x16+1074+665 -bg black -fg yellow -fa ‘verdana’ -fs 9x -T CONSOLA_ESPECIAL -e sudo ./MMDVMESPECIAL MMDVMESPECIAL.ini

cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_ESPECIAL_OFF.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ESPECIAL.desktop