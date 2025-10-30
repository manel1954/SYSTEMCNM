#!/bin/bash

sudo killall qt_editor_radio

mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVM.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVM.ini)
puerto=`expr substr $mode 15 14`
puerto="  "$puerto
cd /home/pi/Desktop

sudo cp RXF_RADIO.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVM.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_RADIO.desktop

sudo cp /home/pi/RXF_RADIO.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_RADIO.desktop

#Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF
sed -i "4c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_RADIO_ON.png" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Cerrar DMO" /home/pi/Abrir_Radio.desktop
sed -i "5c MMDVM=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_Radio.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_Radio.desktop

cd /home/pi/MMDVMHost
xterm -geometry 88x16+1274+665 -bg blue -fg white -fa ‘verdana’ -fs 9x -T CONSOLA_RADIO -e sudo ./MMDVMHost MMDVM.ini

cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sh ejecutar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_RADIO_OFF.png" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Abrir DMO" /home/pi/Abrir_Radio.desktop
sed -i "5c MMDVM=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_Radio.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_Radio.desktop

