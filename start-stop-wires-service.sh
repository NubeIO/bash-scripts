#!/bin/bash
set -e
if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

start() {
    echo "start"
    sudo systemctl start nubeio-rubix-wires.service
}

stop() {
    echo "stop"
    sudo systemctl stop nubeio-rubix-wires.service
}

restart() {
    echo "restart"
    sudo systemctl restart nubeio-rubix-wires.service

}

status() {
    echo "status"
    sudo systemctl status nubeio-rubix-wires.service

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
*)
    echo "Usage: $0 {start|stop|status|restart}"
    ;;
esac

exit 0
