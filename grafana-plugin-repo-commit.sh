#!/bin/bash

repoPath="/home/aidan/code/node/grafana-plugins-builds"

repos=(
  $repoPath"/grafana-mqtt-data-source"
  $repoPath"/grafana-iframe-panel"
  $repoPath"/grafana-read-write-panel"
  $repoPath"/grafana-schedule-panel"
)

for i in ${!repos[@]}; do
  # echo "$i, ${repos[$i]}"
  echo ""
  echo "****** Getting latest for" ${repo} "******"
  echo ${repos[$i]}
  cd "${repos[$i]}"
  pwd


  echo "Enter your message for git commit"
  read message
  git add .
  git commit -m"${message}"
  git push -u origin master
    # git push -u origin master


done

