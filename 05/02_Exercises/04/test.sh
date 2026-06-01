#!/bin/bash
#
function callURL(){
  local PORT=5000
  local args="-f -s -S -k"
#??
  printf "%s\n" "Call frist app without any appointments ..."
#??
  sleep 2
  printf "%s\n" "Set an appointment ..."
#??
#??
#??
  sleep 2
  printf "%s\n" "Show the appointment ..."
#??
}

# Clear screen
clear
# Ask user for action and read it
read -p "Appointement App: [t]est requests: " action
action=$(echo $action | tr '[A-Z]' '[a-z]')
# show selected action
echo "Your selection : $action"
# case/switch
case $action in
t)
  printf "\n---------\nCALL URL\n---------\n"
  callURL
  printf "\n\n"
  ;;
*)
  echo "Incorrect action entered!"
#??
#??