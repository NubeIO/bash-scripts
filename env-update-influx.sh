#!/bin/bash
# example use
# bash env-update-influx.sh --protocal=http --host=0.0.0.0 --port=8086 --db=mydb --uname=admin --pass=admin --path=/data/rubix-wires/ --file=.env
# sed -i 's/INFLUX_DB_PROTOCOL/INFLUX_DB_PROTOCOL=https/g;s/INFLUX_DB_HOST/INFLUX_DB_HOST=0.0.021/g' files/.envtest

# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

while [ $# -gt 0 ]; do
    case "$1" in
    --protocal=*)
        protocal="${1#*=}"
        ;;
    --host=*)
        host="${1#*=}"
        ;;
    --port=*)
        port="${1#*=}"
        ;;
    --db=*)
        db="${1#*=}"
        ;;
    --uname=*)
        uname="${1#*=}"
        ;;
    --pass=*)
        pass="${1#*=}"
        ;;
    --path=*)
        path="${1#*=}"
        ;;
    --file=*)
        file="${1#*=}"
        ;;
    *)
        printf "***************************\n"
        printf "* Error: Invalid argument.*\n"
        printf "***************************\n"
        exit 1
        ;;
    esac
    shift
done

INFLUX_DB_PROTOCOL="INFLUX_DB_PROTOCOL="
INFLUX_DB_HOST="INFLUX_DB_HOST="
INFLUX_DB_PORT="INFLUX_DB_PORT="
INFLUX_DB_DB_NAME="INFLUX_DB_DB_NAME="
INFLUX_DB_USERNAME="INFLUX_DB_USERNAME="
INFLUX_DB_PASSWORD="INFLUX_DB_PASSWORD="

PROTOCOL="INFLUX_DB_PROTOCOL"
HOST="INFLUX_DB_HOST"
PORT="INFLUX_DB_PORT"
NAME="INFLUX_DB_DB_NAME"
USERNAME="INFLUX_DB_USERNAME"
PASSWORD="INFLUX_DB_PASSWORD"

echo "${YELLOW}-----CAT BEFORE UPDATE-----${NC}"
cat $path$file | grep INFLUX
sed -i "s/$PROTOCOL[^\"]*/$INFLUX_DB_PROTOCOL$protocal/g;s/$HOST[^\"]*/$INFLUX_DB_HOST$host/g;s/$PORT[^\"]*/$INFLUX_DB_PORT$port/g;s/$NAME[^\"]*/$INFLUX_DB_DB_NAME$db/g;s/$USERNAME[^\"]*/$INFLUX_DB_USERNAME$uname/g;s/$PASSWORD[^\"]*/$INFLUX_DB_PASSWORD$pass/g" $path$file

echo "${GREEN}-----CAT AFTER UPDATE-----${NC}"
echo "${GREEN}-update file"
cat $path$file | grep INFLUX
