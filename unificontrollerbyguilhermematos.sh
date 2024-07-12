#!/bin/bash

#Criado por Guilherme Matos Nicolas Neves


function ok {
	echo
	echo
	echo
        read -p "$1 [s/n]: " OK

        if [ $OK = 's' -o $OK = 'S' ]
        then
                return 0
        else
                return 22
        fi
}

function option_dependencias {
        echo "Opcao escolhida: Instalar UnifiController"
        echo ""
	
        ok "Instalar UnifiController" && {


		apt-get update

        apt install -y apt-transport-https ca-certificates wget dirmngr gnupg gnupg2 software-properties-common haveged

        cd /tmp/
        
        wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
        echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb buster main" | tee /etc/apt/sources.list.d/adoptopenjdk.list

        wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
        echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

        wget -qO - https://dl.ui.com/unifi/unifi-repo.gpg | apt-key add -
        echo "deb https://www.ui.com/downloads/unifi/debian stable ubiquiti" | tee /etc/apt/sources.list.d/100-ubnt-unifi.list
        
        apt update
        apt install -y adoptopenjdk-8-hotspot mongodb-org unifi

        systemctl enable mongod.service
        systemctl enable haveged.service
        systemctl enable unifi.service

                                                
echo " MM@@MMMMMMMMMMMMMMmmMMMMMMMMMMMMMMMMMM@@ "
echo " MM@@MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM@@@@ "
echo " MM@@MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM@@@@ "
echo " MM@@@@@@MMMMMMMMMMMMMMMMMMMMMMMMMM@@@@@@ "
echo " MM@@@@@@MMMMMMMMMMMMMMMMMMMMMMMMMM@@@@@@ "
echo " MM@@@@@@@@MMMMMMMMMMMMMMMMMMMM@@@@@@@@@@ "
echo " MM@@@@@@@@@@    MMMMMMMMMM@@MM@@@@@@@@@@ "
echo " MM@@@@@@@@@@    MMMMMMMMMM..::@@@@@@@@@@ "
echo " MM@@@@@@@@@@    MM@@@@@@  ::MM@@@@@@@@@@ "
echo " @@@@@@@@@@@@    @@@@@@@@    ::@@@@@@@@@@ "
echo " MM@@@@@@@@@@    ::@@@@@@    MM@@@@@@@@@@ "
echo " MM@@@@@@@@@@@@    @@@@@@    @@@@@@@@@@## "
echo " MM####@@@@@@@@              @@@@@@@@#### "
echo " @@##########@@@@--      mm@@@@########## "
echo " @@################@@#################### "
echo " @@###################################### "
echo " @@###################################### "
echo " @@###################################### "
echo " @@###################################### "
echo " "
echo " "
echo " ----------------UNIFI CONTROLLER INSTALADO! "
echo " ----------------https://ip:8443 "



        }

}



function option_finalizacao {
	echo "Exit..."

	exit 0
}


#------------------------------------------------------------------------------

clear

while true
do
 echo "  _   _   _   _   ___   _____   ___     ___   _   _   ____    _____      _      _       _         _        ___    "
 echo " | | | | | \ | | |_ _| |  ___| |_ _|   |_ _| | \ | | / ___|  |_   _|    / \    | |     | |       / |      / _ \   "
 echo " | | | | |  \| |  | |  | |_     | |     | |  |  \| | \___ \    | |     / _ \   | |     | |       | |     | | | |  "
 echo " | |_| | | |\  |  | |  |  _|    | |     | |  | |\  |  ___) |   | |    / ___ \  | |___  | |___    | |  _  | |_| |  "
 echo "  \___/  |_| \_| |___| |_|     |___|   |___| |_| \_| |____/    |_|   /_/   \_\ |_____| |_____|   |_| (_)  \___/   "
 echo "--------------BY Guilherme Matos/Nicolas Neves------------------"         
    
    
	read -p "
Escolha uma opcao (Realizar na ordem abaixo)

>>>>>>> 1 - Instalar UnifiController
>>>>>>> 0 - Finalizacao
	
Escolha: " OPCAO
	
	case $OPCAO in
	1)
		option_dependencias
	;;

	2)
	        option_download_asterisk
	;;

	0)
		option_finalizacao
	;;

	*)
	        echo "OPCAO INVALIDA";;
	
	esac
done