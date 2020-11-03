#!/bin/bash
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi
# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

LIB_SYSTEMD="/lib/systemd/system/"
ETC_SYSTEMD="/etc/systemd/system/"
echo "${YELLOW}-----START------${NC}"

echo "${YELLOW}--$LIB_SYSTEMD---list services before------${NC}"
ls /lib/systemd/system/ | grep -e node -e red -e bonescript -e dashboard -e nubeio -e pm2 -e rubix
echo "${YELLOW}--*********--${NC}"
echo "${YELLOW}--$ETC_SYSTEMD---list services before------${NC}"
ls /etc/systemd/system/
echo "${YELLOW}--*********--${NC}"

# Bonescript-api
SERVICE="nubeio-bonescript-api.service"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# Bonescript-dashboard
SERVICE="nubeio-bonescript-dashboard.service"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# Node-red
SERVICE="node-red.service"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# Node-red socket
SERVICE="node-red.socket"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# nodered.service
SERVICE="nodered.service"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# nodered.socket
SERVICE="nodered.socket"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# uart-pins.service
SERVICE="nubeio-enable-uart-pins.service" #nubeio-enable-uart-pins.service
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# nubeio-enable-uart-pins.timer
SERVICE="nubeio-enable-uart-pins.timer"
FILE=$LIB_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# uart-pins.service IN ETC
SERVICE="nubeio-enable-uart-pins.service"
FILE=$ETC_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# nubeio-enable-uart-pins.timer IN ETC
SERVICE="nubeio-enable-uart-pins.timer"
FILE=$ETC_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# pm2-debian.service
SERVICE="pm2-debian.service"
FILE=$ETC_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# pm2-pi.service
SERVICE="pm2-pi.service"
FILE=$ETC_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

# bbio.service
SERVICE="bbio.service"
FILE=$ETC_SYSTEMD$SERVICE
if test -f "$FILE"; then
    echo $FILE ": exists"
    echo "DISABLE/STOP/REMOVE: ${SERVICE}"
    sudo systemctl stop $SERVICE
    sudo systemctl disable $SERVICE
    sudo rm $FILE
else
    echo $FILE": dosnt exist"
fi
echo "---------------"

read -p "${YELLOW}Do you wanna disable wires service? <y/N> ${NC}" prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
    SERVICE="nubeio-rubix-wires.service"
    FILE=$ETC_SYSTEMD$SERVICE
    if test -f "$FILE"; then
        echo $FILE ": exists"
        echo "DISABLE/STOP/REMOVE: ${SERVICE}"
        sudo systemctl stop $SERVICE
        sudo systemctl disable $SERVICE
        sudo rm $FILE
    else
        echo $FILE": dosnt exist"
    fi
    echo "---------------"
else
    echo "${YELLOW}--$LIB_SYSTEMD---list services after------${NC}"
    ls /lib/systemd/system/ | grep -e node -e red -e bonescript -e dashboard -e nubeio -e pm2 -e rubix
    echo "${YELLOW}--*********--${NC}"
    echo "${YELLOW}--$ETC_SYSTEMD---list services after------${NC}"
    ls /etc/systemd/system/
    echo "${YELLOW}-----FINISH------${NC}"
    exit 0
fi

echo "${YELLOW}--$LIB_SYSTEMD---list services after------${NC}"
ls /lib/systemd/system/ | grep -e node -e red -e bonescript -e dashboard -e nubeio -e pm2 -e rubix
echo "${YELLOW}--*********--${NC}"
echo "${YELLOW}--$ETC_SYSTEMD---list services after------${NC}"
ls /etc/systemd/system/
echo "${YELLOW}-----FINISH------${NC}"
