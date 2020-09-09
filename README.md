# bash-scripts


## Wires start/stop/logs

### arguments to pass in

- start `start service`
- stop `stop service`
- restart `restart service`
- log `log service` runs  `npm run pm2 logs`
- log_all `log service` runs  `./node_modules/.bin/pm2 logs --lines 1000`
- env `stop service`

- for BBB
`bash wires-service.sh env debian`

- for pi
`bash wires-service.sh env pi`

```
bash wires-service.sh env pi
bash wires-service.sh `ACTION` `DEVICE_TYPE`
bash wires-service.sh env pi  // will run this command as per device type `bash script.bash start -u=pi -hp=/home/pi`
```

## check all existing dirs and files and nodejs
- checks node js version
- check if all the dirs exist. `/data`, `/data/rubix-wires` , `/data/rubix-wires/backup`
- check if all the files  exist. `.env` and `io-calibration.json`

`bash check-wires.sh` 

## DELETE DIRs /data, /home/rubix-wires , /home/bbb-rest-py

### delete the /data folder

`sudo bash delete-dirs-data.sh debian`

`sudo bash ddelete-dirs-data.sh pi`

### delete the /home/rubix-wires , /home/bbb-rest-py
for deleting the wires and bbb rest api

`sudo bash delete-dirs-wires-bbb-rest.sh debian`

`sudo bash delete-dirs-wires-bbb-rest.sh pi``


## Make DIRs /data, /data/rubix-wires , /data/rubix-wires/backup

`bash make-dirs.sh debian`

`bash make-dirs.sh pi`

 then check again

`bash check-wires.sh` 

## stop old services

### Stop/remove All
`sudo bash remove-old-services-all.sh` 


## install nodejs
will install nodejs version 10

`bash install-node-v10.sh` 


## git-pull-wires and bbb-rest
`bash git-pull-wires-bbb-rest.sh debian`

`bash git-pull-wires-bbb-rest.sh pi` 

 then check again if all dirs and files are there
 
`bash check-wires.sh` 

## update wires
`bash wires-update-script.sh debian` 

`bash wires-update-script.sh pi` 

## add enviroment file
`bash add-files-env-io_cal.sh debian`

`bash add-files-env-io_cal.sh pi`

