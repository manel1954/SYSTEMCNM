                
#!/bin/bash                                
                                          
                        cd /home/pi/SYSTEM/qt/
                        ./qt_actualizando_imagen &

                        cd /home/pi/SYSTEMCNM
                        
                        git pull --force                      

                        sudo rm -R /home/pi/SYSTEM

                        mkdir /home/pi/SYSTEM
                                                
                        cp -R /home/pi/SYSTEMCNM/* /home/pi/SYSTEM                     
                        
                        sudo rm -R /home/pi/SYSTEM/qt
                                      
                        cp -R /home/pi/SYSTEMCNM/qt/ /home/pi/SYSTEM/

                        sudo chmod 777 -R /home/pi/SYSTEM
                        
                        sudo chmod 777 -R /home/pi/SYSTEM/qt

                        

                        


                        











