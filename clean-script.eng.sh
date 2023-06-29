#!/bin/bash

# This program is free software : you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

echo #
echo  "\033[43;30m LINUX SYSTEM CLEANUP AND UPDATE SCRIPT / https://github.com/Kusanagi8200 \033[0m"

if [ `whoami` != "root" ]
then
        echo  "\033[5;41;30m WARNING. YOU MUST HAVE SUDO RIGHTS TO RUN THIS SCRIPT \033[0m"
        exit 1
fi

#WARNING UPDATE
echo  "\033[5;41;37m ATTENTION. UNE MISE A JOUR PEUT ENDOMMAGER VOTRE SYSTEME \033[0m"
confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm "VOULEZ VOUS CONTINUER ?"; then
   echo #
   echo  "\033[44;37m ---> POURSUITE DE LA MISE A A JOUR <--- \033[0m"
else
    echo #
    echo  "\033[44;37m ---> FIN DE LA MISE A JOUR <--- \033[0m"
    exit
fi

echo #
echo  "\033[43;30m ---> CHECK LOG FILES \033[0m"

echo #
if [  /var/log/update_upgrade.log ]
then
    echo  "\033[47;32m FILE \033[0m" /var/log/update_upgrade.log = "\033[47;32m OK \033[0m"
else
    echo  "\033[47;31m FILE DOESN'T EXIST \033[0m" & touch /var/log/update_upgrade.log
    echo  "\033[41;33m --> FILE CREATION \033[0m" /var/log/update_upgrade.log = "\033[47;32m DONE \033[0m"
fi

echo #
if [ -e /var/log/update_upgrade.err ]
then
    echo  "\033[47;32m FILE \033[0m" /var/log/update_upgrade.err = "\033[47;32m OK \033[0m"
else
    echo  "\033[47;31m FILE DOESN'T EXIST \033[0m" & touch /var/log/update_upgrade.err
    echo  "\033[41;33m --> FILE CREATION \033[0m" /var/log/update_upgrade.err = "\033[47;32m DONE \033[0m"
fi
echo #

echo #
echo  "\033[43;30m ---> PRE-UPDATE CLEANING \033[0m"
echo #
echo  "\033[44;37m APT CLEAN \033[0m"
apt clean 
echo Done
echo #
echo  "\033[44;37m APT AUTOCLEAN \033[0m"
apt autoclean
echo #
echo  "\033[44;37m APT REMOVE \033[0m"
apt remove 
echo #
echo  "\033[44;37m APT AUTOREMOVE \033[0m"
apt autoremove
echo #
echo  "\033[44;37m APT PURGE \033[0m"
apt purge
echo #
echo  "\033[44;37m APT CHECK \033[0m"
apt-get check
echo #
echo  "\033[43;30m <--- END OF PRE-UPDATE CLEANING \033[0m"

echo #
echo # 

echo  "\033[43;30m ---> UPDATING PACKAGES \033[0m"
apt update && apt list --upgradable
echo #

confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm "UPGRADE ?"; then
   apt upgrade && apt --fix-broken install
else
    echo #
    echo  "\033[44;30m ---> PAS D'UPGRADE <--- \033[0m"
    echo #
    echo  "\033[44;30m ---> FIN DU SCRIPT <--- \033[0m"
    exit
fi

echo #
echo # 

echo  "\033[43;30m <--- PACKAGE UPDATE COMPLETE \033[0m"
echo #
echo # 

echo  "\033[43;30m ---> POST-UPDATE CLEANUP \033[0m"
echo #
echo  "\033[44;37m APT CLEAN \033[0m"
apt clean 
echo Done
echo #
echo  "\033[44;37m APT AUTOCLEAN \033[0m"
apt autoclean
echo #
echo  "\033[44;37m APT REMOVE \033[0m"
apt remove 
echo #
echo  "\033[44;37m APT AUTOREMOVE \033[0m"
apt autoremove
echo #
echo  "\033[44;37m APT PURGE \033[0m"
apt purge
echo #
echo  "\033[44;37m APT CHECK \033[0m"
apt-get check
echo #

echo  "\033[43;30m ---> CACHE CLEANING \033[0m"
sync; echo 3 > /proc/sys/vm/drop_caches
echo  "\033[44;37m DONE \033[0m"
echo # 

echo  "\033[43;30m ---> BIN CLEANING \033[0m"
rm -r -f ~/.local/share/Trash/files/*
echo  "\033[44;37m DONE \033[0m"
echo #

echo  "\033[43;30m ---> NETTOYAGE DES CONFIG DE PAQUETS \033[0m"
if [ "$(dpkg -l | grep ^rc)" ]; then
     dpkg -P $(dpkg -l | awk '/^rc/{print $2}')
else
    echo "\033[44;37m PAS DE PAQUETS À PURGER \033[0m"
fi
echo #

echo  "\033[43;30m <--- END OF POST-UPDATE CLEANUP \033[0m"
echo #
echo #

echo  "\033[43;30m ---> SYSTEME INFORMATION <--- \033[0m"
cat /proc/version
echo #

cat /etc/os-release
echo #
echo #

echo  "\033[43;30m KERNEL LIST \033[0m"
dpkg -l | grep -Ei "linux-(g|h|i|lo|si|t)" |sort -k3 | cut -d" " -s -f1,2,3 | column -s" " -t
echo #
echo #

echo  "\033[43;30m FREE DISK SPACE \033[0m"
df -h 
echo #
echo #

echo  "\033[43;30m HARDWARE AND USER INFORMATION \033[0m"

#INSTALLATION DE NEOFETCH CHECK INFOS SYSTEM
confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm "INSTALLER NEOFETCH ?"; then
   apt install neofetch && neofetch
else
    echo #
    echo  "\033[44;37m ---> NEOFETCH NE SERA PAS INSTALLÉ <--- \033[0m"
    
fi
echo #

echo # 
echo  "\033[43;30m ---> FICHIER LOG ERREUR MAJ \033[0m"

if [ -e /var/log/update_upgrade.err ] && [ /var/log/update_upgrade.err -nt /var/log/update_upgrade.err ]
then
    echo  "\033[5;41;37m ATTENTION \033[0m"
    cat /var/log/update_upgrade.err
    echo
else
    echo  "\033[44;37m NO UPDATE ERROR \033[0m"
fi
echo #
echo #

echo #
echo #

# Reboot ? Function
confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm "REBOOT ?"; then
   reboot
else
    echo #
    echo  "\033[44;37m ---> FIN DU SCRIPT <--- \033[0m"
    
fi
echo #
