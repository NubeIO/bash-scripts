#!/bin/bash
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

user_pi="pi"
user_deb="debian"
user=""

# Console colors
DEFAULT="\033[0m"
GREEN="\033[32m"
RED="\033[31m"

USER=""
USER_GROUP=""
DB_LOCATION="/data/rubix-wires"

# check nodejs version
nv="v0"
nv=$(node -v | cut -d "." -f1)

# make backup dir
createDirIfNotExist() {
    # Create directory and change ownership if not exist
    [[ -d ${DB_LOCATION} ]] || {
        echo -e "${GREEN}Creating a location ${DB_LOCATION} and set ownership ${USER}:$(echo ${USER_GROUP} || echo ${USER})${DEFAULT}"
        sudo mkdir ${DB_LOCATION}
    }
    sudo chown -R ${USER}:$(echo ${USER_GROUP} || echo ${USER}) ${DB_LOCATION}
}

if [[ "$nv" = "v10" ]]; then
    echo "CHECK: nodejs version is == v10"
else
    echo "CHECK: nodejs version is NOT == v10"
    exit
fi

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

echo -e "CHECK/MKDIR: add dir /data/rubix-wires"
createDirIfNotExist

echo "clone wires"
git clone --depth 1 https://github.com/NubeIO/wires-builds.git
echo "Add .env file"
cp file/.env /data/rubix-wires/.env


# check to make sure host is debain or pi
if [ $1 == $user_deb ]; then
    echo -e "CLONE: bbb-py-rest"
    git clone --depth 1 https://github.com/NubeIO/bbb-py-rest.git
    echo "Add io-calibration file"
    cp file/io-calibration.json /data/rubix-wires/io-calibration.json
    # make a backup of nodes.db
    echo -e "CLONE: bbb-py-rest"
    cd "/home/$user"
    cd bbb-py-rest
    bash setup.bash
    echo -e "START/ENABLE: bbb-py-rest & "
    sudo systemctl enable nubeio-bbio.service
    sudo systemctl enable nubeio-enable-uart-pins.timer
    sudo systemctl start nubeio-bbio.service
    sudo systemctl start nubeio-enable-uart-pins.timer
fi

# run install of wires
echo "PM2/UPDATE: bash script.bash start -u=${user} -hp=/home/${user}"
cd "/home/$user"
cd wires-builds/rubix-wires
bash script.bash start -u=${user} -hp=/home/${user}
sudo systemctl start nubeio-rubix-wires.service


