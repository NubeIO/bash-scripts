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

# check nodejs version
nv="v0"
nv=$(node -v | cut -d "." -f1)

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

wires_dir="/home/$user/wires-build"
bbb_rest_dir="/home/$user/wires-build"


HOME_DIR="/home/$user"
REPO_DIR="/home/$user/wires-builds"

echo "clone wires"
echo $REPO_DIR
if [ -d $REPO_DIR ]; then
    echo $REPO_DIR ": exists"
    cd $REPO_DIR
    pwd
    git pull
else
    echo "NOTE: Directory $REPO_DIR does not exists."
    cd $HOME_DIR
    git clone --depth 1 https://github.com/NubeIO/wires-builds.git
fi

REPO_DIR="/home/$user/bbb-py-rest"

# check to make sure host is debain or pi
if [ $1 == $user_deb ]; then
    echo "bbb-py-rest"
    echo $REPO_DIR
    if [ -d $REPO_DIR ]; then
        echo $REPO_DIR ": exists"
        cd $REPO_DIR
        pwd
        git pull
    else
        echo "NOTE: Directory $REPO_DIR does not exists."
        cd $HOME_DIR
        git clone --depth 1 https://github.com/NubeIO/bbb-py-rest.git
    fi
    cd $REPO_DIR
    pwd
    echo -e "START/ENABLE: bbb-py-rest "
fi

