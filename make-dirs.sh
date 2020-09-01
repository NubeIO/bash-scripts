#!/bin/bash

# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

USER=""
USER_GROUP=""
DB_LOCATION="/data"

user_pi="pi"
user_deb="debian"
# USER=""

echo "${YELLOW}-----START------${NC}"

# make sure USER passed in on running of script pi or debian
if [ $1 == $user_pi ]; then
    USER=$user_pi
    echo "USER = $user_pi"
elif [ $1 == $user_deb ]; then
    USER=$user_deb
    echo "USER = $USER"
else
    echo -e "${RED} incorrect USER passed in must be pi or debian"
    exit
fi

DB_LOCATION="/data"
echo "${YELLOW}-----Make dir ${DB_LOCATION}-----${NC}"
# make backup dir
createDirIfNotExist() {
    # Create directory and change ownership if not exist
    [[ -d ${DB_LOCATION} ]] || {
        echo -e "${GREEN}Creating a location ${DB_LOCATION} and set ownership ${USER}:$(echo ${USER_GROUP} || echo ${USER})${DEFAULT}"
        sudo mkdir -p "${DB_LOCATION}"
        sudo chown -R $USER:$USER "${DB_LOCATION}"
    }

}

createDirIfNotExist

DB_LOCATION="/data/rubix-wires"
echo "${YELLOW}-----Make dir ${DB_LOCATION}-----${NC}"
# make backup dir
createDirIfNotExist() {
    # Create directory and change ownership if not exist
    [[ -d ${DB_LOCATION} ]] || {
        echo -e "${GREEN}Creating a location ${DB_LOCATION} and set ownership ${USER}:$(echo ${USER_GROUP} || echo ${USER})${DEFAULT}"
        sudo mkdir -p "${DB_LOCATION}"
        sudo chown -R $USER:$USER "${DB_LOCATION}"

    }

}

createDirIfNotExist

DB_LOCATION="/data/rubix-wires/backup"
echo "${YELLOW}-----Make dir ${DB_LOCATION}-----${NC}"
# make backup dir
createDirIfNotExist() {
    # Create directory and change ownership if not exist
    [[ -d ${DB_LOCATION} ]] || {
        echo -e "${GREEN}Creating a location ${DB_LOCATION} and set ownership ${USER}:$(echo ${USER_GROUP} || echo ${USER})${DEFAULT}"
        sudo mkdir -p "${DB_LOCATION}"
        sudo chown -R $USER:$USER "${DB_LOCATION}"
    }

}

createDirIfNotExist

echo "${YELLOW}-----FINISH------${NC}"
