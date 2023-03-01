#!/bin/bash

#!/bin/bash

# This program is free software : you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

echo # 
echo -e "\033[43;30m INFOS SYSTEME LINUX / Copyright (C) Kusanagi8200/2023 \033[0m"

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



echo -e "\033[43;30m MENU SCRIPTS...........//\033[0m"

menu(){
echo -ne "
$(ColorGreen ' 1 --> ') $(ColorGreen 'BOOT...........//')

$(ColorGreen ' 2 --> ') $(ColorGreen 'HARDWARE.......//')

$(ColorGreen ' 3 --> ') $(ColorGreen 'NETWORK........//') 

$(ColorGreen ' 4 --> ') $(ColorGreen 'SYSTEM.........//')

$(ColorRed ' 0 --> ') $(ColorRed 'EXIT...........//') 

$(ColorGreen 'CHECK OPTION ?') "
        read a
        case $a in
	        1) sh boot-sequence-check.sh ; menu ;;
	        2) sh hardware-infos.sh ; menu ;;
	        3) sh check-network.sh ; menu ;;
	        4) sh system-infos.sh ; menu ;;
		0) exit 0 ;;
		*) echo -e $(ColorRed 'MAUVAIS CHOIX.........//')
        esac
}

# Call the menu function
menu
