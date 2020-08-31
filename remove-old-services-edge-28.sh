#!/bin/bash
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

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



# echo "Add BLANK .env file for wires [Y,n]"
# read input
# if [[ $input == "Y" || $input == "y" ]]; then
#         echo "making .env file"
        
# else
#         echo "no file created"
# fi