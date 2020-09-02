
INFLUX_DB_PROTOCOL=$1
INFLUX_DB_HOST=$2
INFLUX_DB_PORT=$3
INFLUX_DB_DB_NAME=$4
INFLUX_DB_USERNAME=$5
INFLUX_DB_PASSWORD=$6




# sed -e "s/1.0.0-SNAPSHOT/$version/g" bios.json > conf/bios.json
sed -i "s/database_name_here/$MyVar/g" config.php


sed -i "s/'database_name_here'/INFLUX_DB_HOST/g" files/.envtest
