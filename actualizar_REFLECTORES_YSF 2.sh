﻿#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

			#cd /home/pi/YSFClients/YSFGateway
			#sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php
            #clear
			#echo "${VERDE}*********************************"
			#		echo "* ACTUALIZANDO REFLECTORES YSF  *"
			#		echo "*********************************"
			#sleep 3



			
			
			
			
			# cd /home/pi/YSFClients/YSFGateway
			#sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php 
            
			
			#curl https://dvref.com/downloads/YSFHosts-resolved.txt > /home/pi/YSFClients/YSFGateway/YSFHosts.txt
			
			cp /home/pi/SYSTEM/YSFHosts.txt /home/pi/YSFClients/YSFGateway/


			sleep 3
			
			clear
			echo "${VERDE}**********************************"
					echo "*  ACTUALIZANDO REFLECTORES YSF  *"
					echo "**********************************"
			sleep 3
			