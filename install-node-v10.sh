#!/bin/bash
# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

echo "${YELLOW}-----START------${NC}"
echo "${YELLOW}-----CHECK NODE-JS------${NC}"
# check nodejs version
nv="v0"
nv=$(node -v | cut -d "." -f1)
if [[ "$nv" = "v10" ]]; then
    echo "${GREEN}NODE VERSION v10${NC}"
else
    echo "${RED}NODE VERSION NOT!!! v10${NC}"
    echo "${RED}You need to install nodejs version 10${NC}"
    echo "${YELLOW} INSTALL NODEJS${NC}"
    echo "${PURPLE}DOWNLOAD NODE v10${NC}"
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    echo "${PURPLE}run update ${NC}"
    sudo apt-get update
    echo "${PURPLE}install nodejs ${NC}"
    sudo apt install nodejs -y
    echo "${PURPLE}check node js version ${NC}"
    node -v
fi

echo "${YELLOW}-----FINISH------${NC}"