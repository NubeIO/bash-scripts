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
REPO_NAME=wires-builds


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





# will return the version eg: 1.7.2
LATEST_VERSION=$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest | grep "tag_name" | cut -d'v' -f2 | cut -d'"' -f1)
echo "${REPO_NAME}.zip"
# curl -L -o ${REPO_NAME}.zip https://github.com/${ORG_NAME}/${REPO_NAME}/archive/v${LATEST_VERSION}.zip
# curl -L -o ${REPO_NAME}.tar.gz https://github.com/${ORG_NAME}/${REPO_NAME}/archive/v${LATEST_VERSION}.tar.gz


# make a backup of nodes.db
# echo -e "${GREEN}Backup nodes.db${DEFAULT}"
# cd ${HOME_DIR}/${WIRES_LOCATION}/${LATEST_VERSION}
# wires_version=$(cat package.json | grep version | tr -d 'version' | tr -d '"' | tr -d ',' | tr -d ' ' | tr -d ':')
# echo -e "${GREEN}Wires-version before update: ${wires_version}${DEFAULT}"
# # backup wires nodes.db
# FILE="/data/rubix-wires/nodes.db"
# if test -f "$FILE"; then
#     echo "File: ${FILE} exists"
#     mkdir -p ${DB_BACKUP_LOCATION}
#     cp ${DB_LOCATION}/nodes.db ${DB_BACKUP_LOCATION}/nodes.bak.${wires_version}.$(date +%Y_%m_%d-%H:%M:%S).db
# else
#     echo "File: ${FILE} doesn't exists"
# fi
echo -e "${HOME_DIR}/${WIRES_LOCATION}"
echo -e "${REPO_NAME}/rubix-wires-${LATEST_VERSION}"

cd ${HOME_DIR}
rm -r wires-builds
mkdir wires-builds
unzip ${REPO_NAME}.zip
cd ${HOME_DIR}/${WIRES_LOCATION}
pwd
ls
# rm -r *
ls
echo -e "${GREEN}Resetting git hard to master${DEFAULT}"



# unzip -d ${ZIP_DIR} ${REPO_NAME}.zip
echo ${REPO_NAME}-${LATEST_VERSION}
# cd rubix-wires-${LATEST_VERSION}
pwd
ls

# run update of wires
echo -e "${GREEN}Starting with: bash script.bash start -u=${user} -hp=${HOME_DIR} -l=${log}${DEFAULT}"
# bash script.bash start -u=${user} -hp=${HOME_DIR} -l=${log}
