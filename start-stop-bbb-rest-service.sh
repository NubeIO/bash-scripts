#!/bin/bash
set -e
if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

start() {
    echo "start"
    sudo systemctl start nubeio-bbio.service
}

stop() {
    echo "stop"
    sudo systemctl stop nubeio-bbio.service
}

restart() {
    echo "restart"
    sudo systemctl restart nubeio-bbio.service

}

status() {
    echo "status"
    sudo systemctl status nubeio-bbio.service

}

log() {
    echo "log"
    sudo journalctl -f -u nubeio-bbio.service
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
