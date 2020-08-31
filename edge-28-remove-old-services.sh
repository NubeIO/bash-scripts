
# Bonescript-api
bsapi="nubeio-bonescript-api.service"
echo "DISABLE/STOP/REMOVE: ${bsapi}"
sudo systemctl stop $bsapi
sudo systemctl disable $bsapi
sudo rm /lib/systemd/system/$bsapi

# Bonescript-dashboard
bsapi_dash="nubeio-bonescript-dashboard.service"
echo "DISABLE/STOP/REMOVE: ${bsapi_dash}"
sudo systemctl stop ${bsapi_dash}
sudo systemctl disable ${bsapi_dash}
sudo rm /lib/systemd/system/${bsapi_dash}

# Node-red
node_red="node-red.service"
echo "DISABLE/STOP/REMOVE: ${node_red}"
sudo systemctl stop ${node_red}
sudo systemctl disable ${node_red}
node_red_soc="node-red.socket"
echo "DISABLE/STOP/REMOVE: ${node_red_soc}"
sudo systemctl stop ${node_red_soc}
sudo systemctl disable ${node_red_soc}

# uart-pins.service
uart_pins="nubeio-enable-uart-pins.service"
echo "DISABLE/STOP/REMOVE: ${uart_pins}"
sudo systemctl stop n${uart_pins}
sudo systemctl disable ${uart_pins}
sudo rm /lib/systemd/system/${uart_pins}

uart_pins_timmer="nubeio-enable-uart-pins.timer"
echo "DISABLE/STOP/REMOVE: ${uart_pins_timmer}"
sudo systemctl stop ${uart_pins_timmer}
sudo systemctl disable ${uart_pins_timmer}
sudo rm /lib/systemd/system/${uart_pins_timmer}

# pm2-debian.service
pm2_debian="pm2-debian.service"
echo "DISABLE/STOP/REMOVE: ${pm2_debian}"
sudo systemctl stop ${pm2_debian}
sudo systemctl disable ${pm2_debian}
sudo rm /etc/systemd/system/${pm2_debian}

# bbio.service
bbio_service="bbio.service"
echo "DISABLE/STOP/REMOVE: ${bbio_service}"
sudo systemctl stop ${bbio_service}
sudo systemctl disable ${bbio_service}
sudo rm /etc/systemd/system/${bbio_service}

# THIS IS CUURENT BBB-REST nubeio-bbio.service
nubeio_bbio="nubeio-bbio.service"
echo "DISABLE/STOP/REMOVE: ${nubeio_bbio}"
sudo systemctl stop nubeio-bbio.service
sudo systemctl disable nubeio-bbio.service
sudo rm /etc/systemd/system/nubeio-bbio.service

# THIS IS CUURENT BBB-REST nubeio-bbio.service
wires="nubeio-rubix-wires.service"
echo "DISABLE/STOP/REMOVE: ${wires}"
sudo systemctl stop ${wires}
sudo systemctl disable ${wires}
sudo rm /etc/systemd/system/${wires}