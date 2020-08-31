#!/bin/bash
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

echo "CHECK: nodejs version"
node -v

echo "BACKUP/WIRES-DB: cp nodes.db"
cp -p /data/rubix-wires/nodes.db /data/rubix-wires/nodes.bak.`date +%Y_%m_%d-%H:%M:%S`

echo "STOP/DISABLE: nubeio-rubix-wires.service"
sudo systemctl stop nubeio-rubix-wires.service

echo "GIT/RESET: git reset --hard origin/master"
cd wires-builds
pwd
git reset --hard origin/master
echo "GIT/PULL: git pull"
git pull

cd rubix-wires 
pwd

echo "PM2/UPDATE: bash script.bash start -u=pi -hp=/home/pi"
bash script.bash start -u=pi -hp=/home/pi
# pwd