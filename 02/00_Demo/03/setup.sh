#!/bin/bash
#
# If no start-argument has been provided to the bash script then ...
if [ $# -lt 2 ]
then
  # print error message and exit script
  printf "%s\n" \
    "Error: Provide 2 arguments:" \
    "arg 1: configuration" \
    "arg 2: 1 for create container, 2 for remove container" \
    "Exit script."
  exit 1
fi

# Import *.conf data
source "$1"

case $2 in
1)
  # if docker file does not exist ..
  if [ ! -f ${file} ]
  then
    printf "%s\n" \
        "${file} does not exist." \
        "Exit script."
    exit 1
  fi
  # Build a dockerfile with tag -t
  printf "Start building %s ..." ${file}
  docker build -t ${image} -f ${file} .
  sleep 1
  # List images
  docker images
  # sleep 2
  # Run container based on its image
  docker run --name ${container} ${image}
  ;;

2)
  # stop container
  docker stop ${container}
  docker rm ${container}
  # remove image
  docker rmi ${image}
  # Check if the image still exists by filtering all
  # existing images with removed image. When output is empty then
  # image has been successfully removed.
  docker images --format 'table' |grep ${image}
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac

