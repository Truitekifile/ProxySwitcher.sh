#!/bin/bash

# Couleures #Colors


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
GRAS='\033[1m'
CYAN='\033[35m'
NC='\033[0m' # Pas de couleur #No Colors


#Stockées dans le fichier option.txt #Value saved to option.txt
#si il n'existe pas, il sera créé #if the file does not exist, it will be created


OPTIONS_FILE=optionsPS.txt

if [[ -f "$OPTIONS_FILE" ]]; then
  source "$OPTIONS_FILE"
else
	clear
	echo -e ${YELLOW}${GRAS}" _____                 _ _ _       _ _       _"
	echo "|  _  |___ ___ _ _ _ _|   __|_ _ _|_| |_ ___| |_ ___ ___ "
	echo "|   __|  _| . |_'_| | |__   | | | | |  _|  _|   | -_|  _|"
	echo "|__|  |_| |___|_,_|_  |_____|_____|_|_| |___|_|_|___|_|"
	echo "                 |___|" 
	echo
	echo -e ${YELLOW}${GRAS}"Please, choose default values "${NC}
	echo
	read -p "IP: " IP
	read -p "PORT: " PORT
	echo "OPTION FOR PROXYSWITCHER" > "$OPTIONS_FILE"
	echo "IP=$IP" >> "$OPTIONS_FILE"
	echo "PORT=$PORT" >> "$OPTIONS_FILE"
fi

#Manuel #Manual
manual_proxy=$IP
enable_manual_proxy() {
	gsettings set org.gnome.system.proxy mode 'manual'
	gsettings set org.gnome.system.proxy.http host "$manual_proxy"
	gsettings set org.gnome.system.proxy.http port $PORT
	gsettings set org.gnome.system.proxy.https host "$manual_proxy"
	gsettings set org.gnome.system.proxy.https port $PORT
}

# Auto #


enable_auto_proxy() {
	gsettings set org.gnome.system.proxy mode 'auto'
	gsettings set org.gnome.system.proxy autoconfig-url "$auto_proxy"
}


# desactivé #Deactivated


disable_proxy() {
	gsettings set org.gnome.system.proxy mode 'none'
}

##########
# Prompt #
##########

clear

echo -e ${YELLOW}${GRAS}" _____                 _ _ _       _ _       _"
echo "|  _  |___ ___ _ _ _ _|   __|_ _ _|_| |_ ___| |_ ___ ___ "
echo "|   __|  _| . |_'_| | |__   | | | | |  _|  _|   | -_|  _|"
echo "|__|  |_| |___|_,_|_  |_____|_____|_|_| |___|_|_|___|_|"
echo "                 |___|"        
                    
echo 
echo -e ${YELLOW}${GRAS}"["${GREEN}${GRAS}"*"${YELLOW}${GRAS}"]"${NC} "Enter a number to use different options :"
echo -e ${YELLOW}${GRAS}"["${GREEN}${GRAS}"1"${YELLOW}${GRAS}"]"${NC} "Switch the proxy to manual"
echo -e ${YELLOW}${GRAS}"["${GREEN}${GRAS}"2"${YELLOW}${GRAS}"]"${NC} "Switch the proxy to automatic"
echo -e ${YELLOW}${GRAS}"["${GREEN}${GRAS}"3"${YELLOW}${GRAS}"]"${NC} "Deactivate proxy"
echo -e ${YELLOW}${GRAS}"["${GREEN}${GRAS}"4"${YELLOW}${GRAS}"]"${NC} "Change settings"
echo -e ${YELLOW}${GRAS}"["${GREEN}${GRAS}"?"${YELLOW}${GRAS}"]"${NC} "Info"${GREEN}${GRAS}
echo 
read -p " > " choice
echo


# Executer la commande #Execute the selected option


case $choice in
	1)
		enable_manual_proxy
		echo -e ${GREEN} "Proxy switched to manual"${NC}
		echo "	IP = $IP"
		echo "	PORT = $PORT"
		echo
	;;
	2)
		enable_auto_proxy
		echo -e ${GREEN} "Proxy switched to auto"${NC}
		echo
		;;
	
	3)
		disable_proxy
		echo -e ${GREEN} "Proxy switched to disabled"${NC}
		echo
	;;
	4)
		
		echo -e ${YELLOW}${GRAS}"Option tweaks"${NC}
		echo
		read -p "IP: " new_ip
		read -p "PORT: " new_port
		sed -i "s/IP=.*/IP=$new_ip/g" $OPTIONS_FILE
		sed -i "s/PORT=.*/PORT=$new_port/g" $OPTIONS_FILE
		IP=$new_ip
		PORT=$new_port
		echo
		echo -e ${GREEN}"Settings Updateds"${NC}
		echo
	;;

	?)
	  	echo -e ${YELLOW}${GRAS}"Made by Truitekifile"
	  	echo
	  	echo "ver 1.7"
	  	echo
	  	echo -e "Warning, the script does not verify the "${CYAN}${GRAS} "IP"${YELLOW}${GRAS}" and" ${CYAN}${GRAS}"PORT" ${YELLOW}${GRAS}"syntax of the option.txt file. If you enter false values, the proxy may not work"
	  	echo
		echo -e ${CYAN}${GRAS}"Github: "${YELLOW}${GRAS}"https://github.com/Truitekifile"
		echo -e ${CYAN}${GRAS}"Discord: "${YELLOW}${GRAS}"Truitekifile#0777"
		echo
		echo -e ${CYAN}${GRAS}"Note: "${YELLOW}${GRAS}"If you find a bug, please submit a problem on Github with the error message displayed or message me on discord"
		echo -e "" ${NC}

		;;
esac
