#!/bin/bash
# Console colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
PURPLE=$'\033[0;35m'
YELLOW=$'\e[1;33m'

repoPath="/home/aidan/code/node/grafana-plugins-repos"
grafanaPath="/var/lib/grafana/plugins"

repos=(
  $repoPath"/grafana-mqtt-data-source"
  $repoPath"/grafana-iframe-panel"
  $repoPath"/grafana-read-write-panel"
  $repoPath"/grafana-schedule-panel"

)


dirs=( 
  $grafanaPath"/grafana-mqtt-data-source"
  $grafanaPath"/grafana-iframe-panel"
  $grafanaPath"/grafana-read-write-panel"
  $grafanaPath"/grafana-schedule-panel"
)


for i in ${!repos[@]}; do
  # echo "$i, ${repos[$i]}"
  echo ""
  echo "****** Getting latest for" ${repo} "******"
  echo ${repos[$i]}
  cd "${repos[$i]}"
  echo "git reset --hard"
  git reset --hard origin/master
  git pull
  echo "yarn install"
  yarn install
  yarn build
  echo "${YELLOW}-----GIT LOG-----${NC}"
  git log --pretty=format:"%h - %an, %ar : %s"

  echo "${YELLOW}-----UPDATE LOCAL GRAFANA PLUGIN-----${NC}"
  echo "$i, ${dirs[$i]}"
  sudo rm -rf "${dirs[$i]}" && sudo mkdir "${dirs[$i]}"
  sudo cp -a ${repos[$i]}/dist/. ${dirs[$i]}
  # yarn watch &
  # sleep 15
  # kill $! # will kill command after 15sec as yarn watch dosnt finish

  # echo "Enter your message for git commit"
  # read message
  # git add .
  # git commit -m"${message}"
  # if [ -n "$(git status - porcelain)" ]; then
  #   echo "IT IS CLEAN"
  # else
  #   git status
  #   echo "Pushing data to remote server!!!"
  #   git push -u origin master
  # fi

done
echo "${YELLOW}-----completed restart grafana-----${NC}"
echo "completed restart grafana"
sudo systemctl restart grafana-server
echo "${YELLOW}-----check grafana is running wait 15 sec----"
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

