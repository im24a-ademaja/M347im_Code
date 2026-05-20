#!/bin/bash
#
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "(1): remove all, (2): remove only image" \
    "Exit script."
  exit 1
fi

function rmCont() {
  printf "Stop and remove container %s and image %s" ${image} ${container}
  # stop container
  docker stop ${container}
  sleep 3
  # remove container
  docker rm ${container}
}  
function rmImg() {
  printf "Remove image %s" ${image}
  # Remove image
  docker rmi ${image}
  sleep 3
  # check removal of image
  docker images | grep ${image}
}

case $1 in

1)
  rmCont
  # Remove image
  rmImg
  ;;
2)
  rmImg
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
  esac