#!/bin/bash

user_pi="pi"
user_deb="debian"
user=""

# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

USER=""
USER_GROUP=""
DB_LOCATION="/data/rubix-wires"



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

# check to make sure host is debain or pi
if ! cd "/home/$user"; then
    echo -e "${RED} ERROR: make sure this is the correct device"
    exit
fi


echo "${YELLOW}-----START------${NC}"

HOME_DIR="/home/$user"
DIR="/data/rubix-wires"
echo "${YELLOW} TRY ADD .env${NC}"
if [ -d $DIR ]; then
    echo $DIR ": exists"
    echo "Add .env file"
    cp $HOME_DIR/bash-scripts/files/.env $DIR/.env
    cat $DIR/.env
else
    echo "NOTE: Directory $DIR does not exists."

fi

# check to make sure host is debain or pi
if [ $1 == $user_deb ]; then
    echo "${YELLOW} TRY ADD io-calibration.json${NC}"  
    if [ -d $REPO_DIR ]; then
        echo $DIR ": exists"
        echo "Add io-calibration.json file"
        cp $HOME_DIR/bash-scripts/files/io-calibration.json $DIR/io-calibration.json
        cat $DIR/io-calibration.json
    else
        echo "NOTE: Directory $DIR does not exists."
    fi
fi

echo "${YELLOW}-----FINISH------${NC}"