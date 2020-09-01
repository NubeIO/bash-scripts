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
fi



echo "${YELLOW}-----CHECK DISC USAGE------${NC}"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'


echo "${YELLOW}-----CHECK FILES AND DIRs------${NC}"

# Check dir /data
DIR="/data"
echo "CHECK: DIR $DIR exists"
if [ -d $DIR ]; then
    echo "${GREEN}DOES exists${NC}"
else
    echo "${RED} You need to addin $DIR ${NC}"

fi

DIR="/data/rubix-wires"
echo "CHECK: DIR $DIR exists"
if [ -d $DIR ]; then
     echo "${GREEN}DOES exists${NC}"
else
  echo "${RED} You need to addin $DIR ${NC}"

fi

# check file .env
FILE="/data/rubix-wires/.env"
echo "CHECK: FILE $FILE exists"
if test -f "$FILE"; then
    echo "${GREEN} DOES exists ${NC}"
else 
    echo "${RED} You need to addin $FILE ${NC}"
fi

# check file io-calibration.json
FILE="/data/rubix-wires/io-calibration.json"
echo "CHECK: FILE $FILE exists"
if test -f "$FILE"; then
    echo "${GREEN} DOES exists ${NC}"
else 
    echo "${RED} You need to addin if this is a EDGE-28 $FILE ${NC}"
fi

echo "${YELLOW}-----FINISH------${NC}"