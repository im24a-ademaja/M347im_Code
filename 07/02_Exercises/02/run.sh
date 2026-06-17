#!/bin/bash
#
# 1. you need to activate first venv out site this script
# source ../venv/Scripts/activate
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "1 for installation instructions" \
    "2 for running the application" \
    "3 for calling test.sh" \
    "Exit script."
  exit 1
fi

case $1 in
1)
  printf "Now starting CONTAINERIZED task manager"
  docker-compose up --build
  ;;
2)
  printf "Now testing task manager with persistence layer"
  source test.sh
  ;;
3)
  printf "Clean old containers and volumes"
  docker-compose down -v
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac

