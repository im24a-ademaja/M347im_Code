#!/bin/bash
#
if test $# -lt 2
then
  printf "%s\n" \
    "Error: Following arguments are required:" \
    "resource: name of container or image" \
    "action: 1=stop/remove container, 2=remove image" \
    "Exit script."
  exit 1
fi

resource=$1
action=$2

case $action in
1)
  printf "Stop and remove container %s\n" ${resource}
  # stop container
  docker stop ${resource}  #??
  sleep 3
  # Remove container  #??
  docker rm ${resource} #??
  ;;
2)
  printf "Remove image %s" ${resource}
  # Remove image
  docker rmi ${resource}  #??
  # check removal of image
  docker image ls |grep ${resource} #??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
