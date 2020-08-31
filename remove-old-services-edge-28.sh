#!/bin/bash
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

user_pi="pi"
user_deb="debian"
user=""


echo "STOP/DISABLE: nubeio-bonescript-api.service"
sudo systemctl stop nubeio-bonescript-api.service
sudo systemctl disable nubeio-bonescript-api.service

echo "STOP/DISABLE: nubeio-bonescript-dashboard.service"
sudo systemctl stop nubeio-bonescript-dashboard.service
sudo systemctl disable nubeio-bonescript-dashboard.service

echo "STOP/DISABLE: nubeio-enable-uart-pins.service"
sudo systemctl stop nubeio-enable-uart-pins.service
sudo systemctl disable nubeio-enable-uart-pins.service

echo "STOP/DISABLE: nubeio-enable-uart-pins.timer"
sudo systemctl stop nubeio-enable-uart-pins.timer
sudo systemctl disable nubeio-enable-uart-pins.timer

echo "STOP/DISABLE: bbio.service"
sudo systemctl stop bbio.service
sudo systemctl disable bbio.service

echo "STOP/DISABLE: pm2-debian.service"
sudo systemctl stop pm2-debian.service
sudo systemctl disable pm2-debian.service

echo "REMOVE SERVICES: delete old intit scrpits"
sudo rm /lib/systemd/system/nubeio-enable-uart-pins.service
sudo rm /lib/systemd/system/nubeio-enable-uart-pins.timer
sudo rm /lib/systemd/system/nubeio-bonescript-dashboard.service
sudo rm /lib/systemd/system/nubeio-bonescript-api.service
sudo rm /etc/systemd/system/pm2-debian.service
sudo rm /etc/systemd/system/bbio.service

# make sure user passed in on running of script pi or debian
if [ $1 == $user_pi ]; then
    user=$user_pi
    echo "user = $user_pi"
elif [ $1 == $user_deb ]; then
    user=$user_deb
    echo "user = $user"
else
    echo -e "${RED} incorrect user passed in must be pi or debian"
    exit
fi

echo $user
# check to make sure host is debain or pi
if ! cd "/home/$user"; then
    echo -e "${RED} ERROR: make sure this is the correct device"
    exit
fi

# option to delete wires
echo "remove wires [Y,n]"
read input
if [[ $input == "Y" || $input == "n" ]]; then
        echo "removing wires dir"
        cd "/home/$user"
        sudo rm -r wires-build
        
else
        echo "nothing to delete"
fi

# option to delete BBB-REST-API
echo "remove BBB-REST-API [Y,n]"
read input
if [[ $input == "Y" || $input == "n" ]]; then
        echo "removing bbb-py-rest dir"
        cd "/home/$user"
        sudo rm -r bbb-py-rest
        
else
        echo "nothing to delete"
fi