#!/bin/bash

repoPath="/home/aidan/code/node/grafana"
grafanaPath="/var/lib/grafana/plugins"

repos=( 
  $repoPath"/grafana-mqtt-data-source"
  $repoPath"/grafana-iframe-panel"

)

dirs=( 
  $grafanaPath"/grafana-mqtt-data-source"
  $grafanaPath"/grafana-iframe-panel"
)


for i in ${!repos[@]}; do
  # echo "$i, ${repos[$i]}"
  echo ""
  echo "****** Getting latest for" ${repo} "******"
  echo ${repos[$i]}
  cd "${repos[$i]}"
  git pull
  echo "yarn install"
  yarn install
  # yarn watch & sleep 15 ; kill $!  # will kill command after 15sec as yarn watch dosnt finish
  echo "$i, ${dirs[$i]}"
  sudo rm -rf "${dirs[$i]}" && sudo mkdir "${dirs[$i]}"
  sudo cp -a ${repos[$i]}/dist/. ${dirs[$i]}
  # echo "****** done update of" ${repo} "******"
done

