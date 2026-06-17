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
  printf "Manually activate virtual environment by typing:\n"
  printf "Depending from the installation path of your virtual environment:\n"
  printf "i.e. source ../../../venv/Scripts/activate\n"
  printf "Then install dependencies with:\n"
  printf "pip install -r requirements.txt"
  printf "Start MongoDB locally"
  ;;
2)
  printf "Now starting task manager"
  python task_manager.py
  ;;
3)
  printf "Now testing task manager with persistence layer"
  source test.sh
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac

