#!/bin/bash
#
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "(1): remove all, (2): remove only image" \
    "Exit script."
  exit 1
fi

case $1 in
1)
  printf "Stop and remove container %s and image %s" ${image} ${container}
  # stop container
#??
  sleep 3
#??
#??
  # Remove image
#??
  # check removal
#??
  ;;
2)
  printf "Remove image %s" ${image}
  # Remove image
#??
  # check removal of image
#??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
