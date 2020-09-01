#!/bin/bash

SERVICE="nubeio-bbio.service"

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

log() {
    echo "log $SERVICE"
    sudo journalctl -f -u $SERVICE
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
*)
    echo "Usage: $0 {start|stop|status|restart|log}"
    ;;
esac

exit 0
