#!/bin/bash

# Example when you want to disable logs:
# sudo bash wires-update-scipt.sh pi false

# Example when you want to enable logs:
# sudo bash wires-update-scipt.sh debian true

# Console colors
RED="\033[31m"
DEFAULT="\033[0m"
GREEN="\033[32m"

DB_LOCATION="/data/rubix-wires"
DB_BACKUP_LOCATION="/data/rubix-wires/backup"
WIRES_LOCATION="wires-builds"

user_pi="pi"
user_deb="debian"

user=""
log=true

ORG_NAME=NubeIO
WIRES_BUILDS=wires-builds
RUBIX_WIRES=rubix-wires

# make sure user passed in on running of script pi or debian
if [ "$1" == $user_pi ]; then
    user=$user_pi
elif [ "$1" == $user_deb ]; then
    user=$user_deb
else
    echo -e "${RED} incorrect user passed in must be pi or debian"
    exit
fi

if [ "$2" == "false" ]; then
    log=false
fi

HOME_DIR="/home/$user"

# check to make sure host is debain or pi
if ! cd $HOME_DIR; then
    echo -e "${RED}Error: make sure this is the correct device${DEFAULT}"
    exit
fi

echo -e "${GREEN}Trying to start script with user: ${user} with install log rotate flag: ${ilr}${DEFAULT}"



# make a backup of nodes.db
echo -e "${GREEN}Backup nodes.db${DEFAULT}"

cd ${HOME_DIR}/wires-builds
cd $(ls -d */|head -n 1) # takes you into the first dir
cd $(ls -d */|head -n 1) # takes you into the first dir
wires_version=$(cat package.json | grep version | tr -d 'version' | tr -d '"' | tr -d ',' | tr -d ' ' | tr -d ':')
echo -e "${GREEN}Wires-version before update: ${wires_version}${DEFAULT}"
# backup wires nodes.db
FILE="/data/rubix-wires/nodes.db"
if test -f "$FILE"; then
    echo "File: ${FILE} exists"
    mkdir -p ${DB_BACKUP_LOCATION}
    cp ${DB_LOCATION}/nodes.db ${DB_BACKUP_LOCATION}/nodes.bak.${wires_version}.$(date +%Y_%m_%d-%H:%M:%S).db
else
    echo "File: ${FILE} doesn't exists"
fi


WIRES_ZIP=${WIRES_BUILDS}.zip
cd ${HOME_DIR}
if [ -f $WIRES_ZIP ] ; then
    rm $WIRES_ZIP
fi
if [ -f $WIRES_BUILDS ] ; then
    rm $WIRES_BUILDS
fi

# will return the version eg: 1.7.2
LATEST_VERSION=$(curl -s https://api.github.com/repos/${ORG_NAME}/${WIRES_BUILDS}/releases/latest | grep "tag_name" | cut -d'v' -f2 | cut -d'"' -f1)
echo "${WIRES_ZIP}"
curl -L -o ${WIRES_BUILDS}.zip https://github.com/${ORG_NAME}/${WIRES_BUILDS}/archive/v${LATEST_VERSION}.zip
echo -e "${GREEN}make new dir mkdir wires-builds the unzip${DEFAULT}"
mkdir wires-builds
pwd
ls
sleep 3
unzip -d ${HOME_DIR}/${WIRES_BUILDS} ${WIRES_BUILDS}.zip
cd ${HOME_DIR}/${WIRES_BUILDS}/${WIRES_BUILDS}-${LATEST_VERSION}/${RUBIX_WIRES}
pwd
ls
# run update of wires
echo -e "${GREEN}Starting with: bash script.bash start -u=${user} -hp=${HOME_DIR} -l=${log}${DEFAULT}"
bash script.bash start -u=${user} -hp=${HOME_DIR} -l=${log}
cd ${HOME_DIR}
if [ -f $WIRES_ZIP ] ; then
    rm $WIRES_ZIP
fi
