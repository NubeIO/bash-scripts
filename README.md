# bash-scripts

## check all existing dirs and files and nodejs
- checks node js version
- check if all the dirs exist. `/data`, `/data/rubix-wires` , `/data/rubix-wires/backup`
- check if all the files  exist. `.env` and `io-calibration.json`
`bash check-wires.sh` 

## stop old services

### EDGE-28
`sudo bash remove-old-services-edge-rest-api.sh` 

### RUBIX-COMPUTE
`sudo bash remove-old-services-wires.sh` 


## install nodejs
will install nodejs version 10
`bash install-node-v10.sh` 

## Make DIRs /data, /data/rubix-wires , /data/rubix-wires/backup
`bash make-dirs.sh debian`
`bash make-dirs.sh pi`

## git-pull-wires and bbb-rest
`bash git-pull-wires.sh debian` 
`bash git-pull-wires.sh pi` 

## update wires
`bash wires-update-script.sh debian` 
`bash wires-update-script.sh pi` 

