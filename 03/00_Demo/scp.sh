#!/bin/bash
#
# retrieve DEST and PRIVATE_KEY from personal configuration
CONF='/c/Data/Development/wp_appi-repo/00_Resources/conf/aws.conf'
# check if configuration exists
if [ ! -f $CONF ]; then
  echo $CONF does not exist!
  exit 2
fi
# Import configuration
source ${CONF}

#----------------------------------------
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "Prep number n" \
    "Exit script."
  exit 1
fi

function rmDir() {
  local trg=$1
  echo "Remove directory ${trg} on ${DEST}"
  ssh -i ${PRIVATE_KEY} ${DEST} "rm -rf ${trg}"
}

function createDir() {
  local trg=$1
  echo "Create directory ${trg} on ${DEST}"
  ssh -i ${PRIVATE_KEY} ${DEST} "mkdir -p ${trg}"
}
function copyDir() {
  local src=$1
  local trg=$2
  scp -r -i ${PRIVATE_KEY} ${src} ${DEST}:${trg}
}

function copyFile() {
  local file=$1
  local trg=$2
  scp -r -i ${PRIVATE_KEY} ${file} ${DEST}:${trg}
}

case $1 in
0)
  TRG="~/02/ex/bin"
  rmDir ${TRG}; createDir ${TRG}
  copyFile "./bin/td-base.sh" ${TRG}
  ;;
1)
  TRG="~/02/ex/01"
  rmDir ${TRG}; createDir ${TRG}
  copyDir "./01" "~/02/ex/"
  ;;
2)
  TRG="~/02/ex/02"
  rmDir ${TRG}; createDir ${TRG}
  copyDir "./02" "~/02/ex/"
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
