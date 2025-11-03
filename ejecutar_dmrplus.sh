#!/bin/bash

sudo killall -9 qt_editor_dmrplus

mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVMPLUS.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $mode 15 14`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMRPLUS.desktop

cp /home/pi/RXF_DMRPLUS.desktop /home/pi/Desktop

rm /home/pi/RXF_DMRPLUS.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF   
sed -i "2c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==3" /home/pi/version-fecha-actualizacion)
cd /home/pi/Desktop
cp Abrir_MMDVMPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sh cerrar_dmrplus.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_DMRPLUS_ON.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "6c MMDVMPLUS=ON" /home/pi/status.ini
cd /home/pi
cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop

rm /home/pi/Abrir_MMDVMPLUS.desktop

cd /home/pi/MMDVMHost
xterm -geometry 88x11+648+670 -bg black -fg white -fa ‘verdana’ -fs 9x -T CONSOLA_DMR+ -e sudo ./MMDVMPLUS MMDVMPLUS.ini

#chromium-browser

cd /home/pi/Desktop
cp Abrir_MMDVMPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sh ejecutar_dmrplus.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_DMRPLUS_OFF.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "6c MMDVMPLUS=OFF" /home/pi/status.ini
cd /home/pi
cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
sleep 1
rm /home/pi/Abrir_MMDVMPLUS.desktop
