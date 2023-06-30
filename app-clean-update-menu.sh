#!/bin/bash

# This program is free software : you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.

echo # 
echo -e "\033[43;30m APP CLEAN AND UPDATE LINUX / Copyright (C) Kusanagi8200/2023 \033[0m"

if [ `whoami` != "root" ]
then
        echo -e "\033[5;41;30mATTENTION. VOUS DEVEZ AVOIR LES DROITS SUDO POUR LANCER CE SCRIPT \033[0m"
        exit 1
fi
echo #

##
# Color  Variables
##

green='\033[43;30m'
red='\033[41;30m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorRed(){
	echo -ne $red$1$clear
}



echo -e "\033[43;30m MENU SCRIPTS ...................//\033[0m"

menu(){
echo -ne "
$(ColorGreen ' 1 --> ') $(ColorGreen 'Clean-script ............//')

$(ColorGreen ' 2 --> ') $(ColorGreen 'Clean-script-fast .......//')

$(ColorGreen ' 3 --> ') $(ColorGreen 'Clean-script-vm .........//') 

$(ColorGreen ' 4 --> ') $(ColorGreen 'Clean-script.eng ........//')

$(ColorGreen ' 5 --> ') $(ColorGreen 'Clean-script-fast.eng ...//')

$(ColorGreen ' 6 --> ') $(ColorGreen 'boot-sequence-check .....//')

$(ColorGreen ' 7 --> ') $(ColorGreen 'check-network ...........//')

$(ColorGreen ' 8 --> ') $(ColorGreen 'hardware-infos ..........//')

$(ColorGreen ' 9 --> ') $(ColorGreen 'system-infos ............//')

$(ColorRed   ' 0 --> ') $(ColorRed   'EXIT ....................//') 

$(ColorGreen 'SCRIPT NUMBER ..............// = ') "
        read a
        case $a in
	        1) sh clean-script.sh ; menu ;;
	        2) sh clean-script-fast.sh ; menu ;;
	        3) sh clean-script-vm.sh ; menu ;;
	        4) sh clean-script.eng.sh ; menu ;;
                5) sh clean-script-fast.eng.sh ; menu ;;
         	6) sh boot-sequence-check.sh ; menu ;;
	  	7) sh check-network.sh ; menu ;;
    		8) sh hardware-infos.sh ; menu ;;
      		9) sh system-infos.sh ; menu ;;  
		0) exit 0 ;;
		*) echo -e $(ColorRed 'MAUVAIS CHOIX ...................//')
        esac
}

# Call the menu function
menu
