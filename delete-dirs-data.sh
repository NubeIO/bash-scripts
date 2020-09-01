#!/bin/bash

# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

user_pi="pi"
user_deb="debian"
user=""

echo "${YELLOW}-----START------${NC}"

echo "${YELLOW}-----CHECK USER IS CORRECT------${NC}"

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

# Check dir /wires-builds
echo "${YELLOW}-----CHECK data/rubix-wires -----${NC}"
DIR="/data/rubix-wires"
echo "CHECK: DIR $DIR exists"
if [ -d $DIR ]; then
    echo "${GREEN}DOES exists${NC}"
    sudo rm -r $DIR
else
    echo "${RED} NOT FOUND $DIR ${NC}"
fi


echo "${YELLOW}-----FINISH------${NC}"
