#!/bin/bash
#
function setup() {
    printf "%s\n" "Set docker compose ..."
    sudo apt install docker-compose
    sleep 1
    docker-compose --version
    docker-compose --help
}


function start(){
  printf "\n---------\n%s\n---------\n" "Docker-Compose start"
  printf "%s\n" "found yaml-files ..."
#??
#??
#??
#??
#??
#??
#??
#??
  sleep 2
  docker ps
  sleep 2
#??
}

function stop(){
  printf "\n---------\n%s\n---------\n" "Docker-Compose STOP"
  printf "%s\n" "found yaml-files ..."
#??
#??
#??
#??
#??
#??
#??
#??
  sleep 2
  docker ps
  printf "\n\n"
}

function logs(){
  printf "\n---------\n%s\n---------\n" "Show logs"
#??
#??
  printf "\n\n"
}

function process(){
  printf "\n---------\n%s\n---------\n" "Show process"
#??
#??
  printf "\n\n"
}


# Clear screen
clear
# Ask user for action and read it
read -p "Docker-Compose: set-[u]p, [s]art, st[o]p, [l]ogs, [p]rocess: " action
action=$(echo $action | tr '[A-Z]' '[a-z]')
# show selected action
echo "Your selection : $action"
# case/switch
case $action in
#??
#??
#??
#??
#??
*)
  echo "Incorrect action entered!"
#??
esac