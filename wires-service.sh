#!/bin/bash
# example
# bash wires-service.sh env pi
# bash wires-service.sh `ACTION` `DEVICE_TYPE`
# bash wires-service.sh env pi  // will run this command as per device type `bash script.bash start -u=pi -hp=/home/pi`

user_pi="pi"
user_deb="debian"
user=""

# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

# make sure user passed in on running of script pi or debian
if [ $2 == $user_pi ]; then
    user=$user_pi
    echo "user = $user_pi"
elif [ $2 == $user_deb ]; then
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

SERVICE="nubeio-rubix-wires.service"
start() {
    echo "start $SERVICE"
    sudo systemctl start $SERVICE
}

stop() {
    echo "stop $SERVICE"
    sudo systemctl stop $SERVICE
}

restart() {
    echo "restart $SERVICE"
    sudo systemctl restart $SERVICE
}

status() {
    echo "status $SERVICE"
    sudo systemctl status $SERVICE
}

env() {
    echo "env $SERVICE"
    cd "/home/$user/wires-builds/rubix-wires"
    pwd
    bash script.bash start -u=${user} -hp=/home/${user}
}

log() {
    echo "log $SERVICE"
    DIR="/home/$user/wires-builds/rubix-wires"
    # Check dir /wires-builds
    echo "${YELLOW}-----CHECK wires-builds -----${NC}"
    echo "CHECK: DIR $DIR exists"
    if [ -d $DIR ]; then
        echo "${GREEN}check logs${NC}"
        cd $DIR
        npm run pm2 logs
    else
        echo "${RED} NOT FOUND $DIR ${NC}"
    fi
}

log_all() {
    echo "log $SERVICE"
    DIR="/home/$user/wires-builds/rubix-wires"
    # Check dir /wires-builds
    echo "${YELLOW}-----CHECK wires-builds 1000 -----${NC}"
    echo "CHECK: DIR $DIR exists"
    if [ -d $DIR ]; then
        echo "${GREEN}check logs${NC}"
        cd $DIR
        ./node_modules/.bin/pm2 logs --lines 1000
    else
        echo "${RED} NOT FOUND $DIR ${NC}"
    fi

}

case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
status)
    status
    ;;
log)
    log
    ;;
log_all)
    log_all
    ;;
env)
    env
    ;;
*)
    echo "Usage: $0 {start|stop|status|restart|env|log|log_all}"
    ;;
esac

exit 0
