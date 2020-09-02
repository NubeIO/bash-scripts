#!/bin/bash
# example use
# sudo bash grafana-puglins-git-pull.sh /home/aidan/code/node/grafana-plugins-builds /var/lib/grafana/plugins
set -e
if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

repoPath=$1
grafanaPath=$2

repos=( 
  $repoPath"/grafana-mqtt-data-source-build"
  $repoPath"/grafana-read-write-panel-build"
  $repoPath"/grafana-iframe-panel-build"
  $repoPath"/grafana-schedule-panel-build"

)

dirs=( 
  $grafanaPath"/grafana-mqtt-data-source"
  $grafanaPath"/grafana-read-write-panel"
  $grafanaPath"/grafana-iframe-panel"
  $grafanaPath"/grafana-schedule-panel"
)


for i in ${!repos[@]}; do
  echo ""
  echo "****** Getting latest for" ${dirs[$i]} "******"
  cd "${repos[$i]}"
  git log --pretty=format:"%h - %an, %ar : %s"
  git pull
  echo "$i, ${dirs[$i]}"
  sudo rm -rf "${dirs[$i]}" && sudo mkdir "${dirs[$i]}"
  sudo cp -a ${repos[$i]} ${dirs[$i]}

done
echo "completed restart grafana"
sudo systemctl restart grafana-server
echo "check grafana is running wait 15 sec"
sleep 3
echo "..."
sleep 3
echo "......"
sleep 3
echo "........."
sleep 3
echo "......"
sleep 3
echo "..."
sudo systemctl status grafana-server

