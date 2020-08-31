#!/bin/bash

# example use for rubix-compute `sudo bash wires-update-scipt.sh pi`
# example use for rubix-compute `sudo bash wires-update-scipt.sh debian`


set -e
if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

# Console colors
DEFAULT="\033[0m"
GREEN="\033[32m"
RED="\033[31m"

USER=""
USER_GROUP=""
DB_LOCATION="/data/rubix-wires/backup"

user_pi="pi"
user_deb="debian"
user=""

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

# make backup dir
createDirIfNotExist() {
    # Create directory and change ownership if not exist
    [[ -d ${DB_LOCATION} ]] || {
        echo -e "${GREEN}Creating a location ${DB_LOCATION} and set ownership ${USER}:$(echo ${USER_GROUP} || echo ${USER})${DEFAULT}"
        sudo mkdir ${DB_LOCATION}
    }
    sudo chown -R ${USER}:$(echo ${USER_GROUP} || echo ${USER}) ${DB_LOCATION}
}

# check nodejs version
nv="v0"
nv=$(node -v | cut -d "." -f1)
if [[ "$nv" = "v10" ]]; then
    echo "CHECK: nodejs version is == v10"
else
    echo "CHECK: nodejs version is NOT == v10"
fi

echo $DEFAULT

# stop wires
echo "STOP/DISABLE: nubeio-rubix-wires.service"
sudo systemctl stop nubeio-rubix-wires.service

echo -e "CHECK/MKDIR: createDirIfNotExist"
createDirIfNotExist

# make a backup of nodes.db
echo "BACKUP/WIRES-DB: cp nodes.db"
cd "/home/$user"
cd wires-builds/rubix-wires

wires_version=$(cat package.json | grep version | tr -d 'version' | tr -d '"' | tr -d ',' | tr -d ' ' | tr -d ':')
echo ${wires_version}
cp -p /data/rubix-wires/nodes.db /data/rubix-wires/backup/nodes.bak.${wires_version}.$(date +%Y_%m_%d-%H:%M:%S)

# git reset
echo "GIT/RESET: git reset --hard origin/master"
cd "/home/$user"
cd wires-builds
git reset --hard origin/master

# git pull
echo "GIT/PULL: git pull"
git pull

# run update of wires
echo "PM2/UPDATE: bash script.bash start -u=${user} -hp=/home/${user}"
cd "/home/$user"
cd wires-builds/rubix-wires
bash script.bash start -u=${user} -hp=/home/${user}
