#!/bin/bash
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
createDirIfNotExist() {
    # Create directory and change ownership if not exist
    [[ -d ${DB_LOCATION} ]] || {
        echo -e "${GREEN}Creating a location ${DB_LOCATION} and set ownership ${USER}:`echo ${USER_GROUP} || echo ${USER}`${DEFAULT}"
        sudo mkdir ${DB_LOCATION}
    }
    sudo chown -R ${USER}:`echo ${USER_GROUP} || echo ${USER}` ${DB_LOCATION}
}



nv="v0"
nv=`node -v | cut -d "." -f1`
if [[ "$nv" = "v10" ]]
    then
        echo -e "${GREEN} CHECK: nodejs version is == v10"
    else
        echo -e "${RED} CHECK: nodejs version is NOT == v10"
fi


wires_version=$(cat  wires-builds/rubix-wires/package.json | grep version |  tr -d 'version' | tr -d '"' | tr -d ',' | tr -d ' ' | tr -d ':')
echo ${wires_version}

echo -e "${GREEN} CHECK/MKDIR: createDirIfNotExist"
createDirIfNotExist
echo "BACKUP/WIRES-DB: cp nodes.db"
cp -p /data/rubix-wires/nodes.db /data/rubix-wires/backup/nodes.bak.${wires_version}.`date +%Y_%m_%d-%H:%M:%S`



echo "STOP/DISABLE: nubeio-rubix-wires.service"
sudo systemctl stop nubeio-rubix-wires.service

echo "GIT/RESET: git reset --hard origin/master"
cd wires-builds

git reset --hard origin/master
echo "GIT/PULL: git pull"
git pull

cd rubix-wires 
pwd

echo "PM2/UPDATE: bash script.bash start -u=pi -hp=/home/pi"
bash script.bash start -u=pi -hp=/home/pi
