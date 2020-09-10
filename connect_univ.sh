#!/bin/bash

net=wlo1-univ-paris13
user=user_id # identifiant
pw=user_pw # mot de passe
url="https://portailaruba.univ-paris13.fr/cgi-bin/login?cmd=login&mac=24:fd:52:8e:3d:7c&ip=10.100.1.57&essid=univ%2Dparis13&apname=IUT_VIL_S208_ET1_AP&apgroup=1.AP_Villetaneuse&url=http%3A%2F%2Fdetectportal%2Efirefox%2Ecom%2Fsuccess%2Etxt"
help="
usage : $0 <commands> \n
startnet ........ ce connecte au réseau \n
startuniv ....... s'autentifie sur le réseau de l'université \n
stopnet ......... ce déconnecte du réseau
"

if [ $# -ne 1 ]; then
    echo -e $help
    exit 1
fi

if [ $1 == "startnet" ]; then
    sudo netctl start $net
    echo "connecter au réseau"
elif [ $1 == "startuniv" ]; then
    curl -s -X POST -F "user=$user" -F "password=$pw" $url
    echo "connecter au wifi de l'université"
elif [ $1 == "stopnet" ]; then
    sudo netctl stop $net
    echo "déconnecté du réseau"
else
    echo -e $help
fi
