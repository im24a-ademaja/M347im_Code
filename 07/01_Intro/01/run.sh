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
  printf "source ../../../venv/Scripts/activate\n"
  printf "Then install dependencies with:\n"
  printf "pip3 install -r requirements.txt"
  ;;
2)
  python task_manager.py
  ;;
3)
  source test.sh
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac

