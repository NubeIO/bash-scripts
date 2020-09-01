# bash-scripts

## check all existing dirs and files and nodejs
- checks node js version
- check if all the dirs exist. `/data`, `/data/rubix-wires` , `/data/rubix-wires/backup`
- check if all the files  exist. `.env` and `io-calibration.json`

`bash check-wires.sh` 

## Make DIRs /data, /data/rubix-wires , /data/rubix-wires/backup

`bash make-dirs.sh debian`

`bash make-dirs.sh pi`

 then check again

`bash check-wires.sh` 

## stop old services

### Stop/remove All
`sudo bash remove-old-services-all.sh` 

### Stop/remove all but wires
`sudo bash remove-old-services-not-wires.sh` 


## install nodejs
will install nodejs version 10

`bash install-node-v10.sh` 


## git-pull-wires and bbb-rest
`bash git-pull-wires.sh debian`

`bash git-pull-wires.sh pi` 

 then check again if all dirs and files are there
 
`bash check-wires.sh` 

## update wires
`bash wires-update-script.sh debian` 

`bash wires-update-script.sh pi` 

