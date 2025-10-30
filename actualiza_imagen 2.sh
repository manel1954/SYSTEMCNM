                
#!/bin/bash                                
                                          
                        cd /home/pi/SYSTEM/qt/
                        ./qt_actualizando_imagen &

                        cd /home/pi/SYSTEM3
                        
                        git pull --force                      




                        sudo rm -R /home/pi/SYSTEM

                        mkdir /home/pi/SYSTEM
                                                
                        cp -R /home/pi/SYSTEM3/* /home/pi/SYSTEM                     
                        
                        sudo rm -R /home/pi/SYSTEM/qt

                                      
                        cp -R /home/pi/SYSTEM3/qt/ /home/pi/SYSTEM/

                        sudo chmod 777 -R /home/pi/SYSTEM
                        
                        sudo chmod 777 -R /home/pi/SYSTEM/qt

                        

                        


                        











