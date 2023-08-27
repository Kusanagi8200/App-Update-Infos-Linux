#!/bin/bash

# This program is free software : you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.

echo # 
echo -e "\033[46;30m UPDATE - CLEAN - SYSTEM - NETWORK / Kusanagi8200/2023 \033[0m"

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
$(ColorGreen ' 1 --> ') $(ColorGreen 'CLEAN-SCRIPT ..............//__________________')

$(ColorGreen ' 2 --> ') $(ColorGreen 'CLEAN-SCRIPT-FAST .........//__________________')

$(ColorGreen ' 3 --> ') $(ColorGreen 'CLEAN-SCRIPT-VM ...........//__________________') 

$(ColorGreen ' 4 --> ') $(ColorGreen 'CLEAN-SCRIPT-ENG ..........//__________________')

$(ColorGreen ' 5 --> ') $(ColorGreen 'CLEAN-SCRIPT-FAST-ENG .....//__________________')          

$(ColorGreen ' 6 --> ') $(ColorGreen 'BOOT-SEQUENCE-CHECK .......//__________________')

$(ColorGreen ' 7 --> ') $(ColorGreen 'CHECK-NETWORK .............//__________________')

$(ColorGreen ' 8 --> ') $(ColorGreen 'HARDWARE-INFOS ............//__________________')

$(ColorGreen ' 9 --> ') $(ColorGreen 'SYSTEM-INFOS ..............//__________________')

$(ColorRed   ' 0 --> ') $(ColorRed   'EXIT ......................//__________________')

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
