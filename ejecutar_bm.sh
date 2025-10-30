#!/bin/bash

sudo killall -9 qt_editor_bm

mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVMBM.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMBM.ini)
puerto=`expr substr $mode 15 14`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_BM.desktop /home/pi

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
frecuencia=`expr substr $frecuencia 13 17`
frecuencia=$frecuencia$puerto
sed -i "12c Name=$frecuencia" /home/pi/RXF_BM.desktop

sudo cp /home/pi/RXF_BM.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_BM.desktop

#Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF  
sed -i "1c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_BM_ON.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=Cerrar BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMBM.desktop

cd /home/pi/MMDVMHost
xterm -geometry 88x16+22+665 -bg brown -fg white -fa ‘verdana’ -fs 9x -T CONSOLA_BRANDMEISTER -e sudo ./MMDVMBM MMDVMBM.ini

cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sh ejecutar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_BM_OFF.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=Abrir BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMBM.desktop
