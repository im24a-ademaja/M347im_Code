#!/bin/bash
#
# retrieve DEST and PRIVATE_KEY from personal configuration
#CONF='<YOUR-PATH>/aws.conf'
#??
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
  ssh -i ${PRIVATE_KEY} ${DEST} "rm -rf ${trg}" 2>/dev/null
}

function createDir() {
  local trg=$1
  echo "Create directory ${trg} on ${DEST}"
  ssh -i ${PRIVATE_KEY} ${DEST} "mkdir -p ${trg}" 2>/dev/null
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
function copyFromAll() {
  local trg=$1
  scp -r -i ${PRIVATE_KEY} ${DEST}:${trg} .
}

function createDemo() {
  local part=$1
  local TRG=${UNIT}"/"${part}
  rmDir ${TRG}; createDir ${TRG}
  copyDir "./${part}" ${UNIT}
}

UNIT="~/03/sol"

case $1 in
0)
  TRG=${UNIT}"/bin"
  rmDir ${TRG}; createDir ${TRG}
  copyDir "./bin" ${UNIT}
  ;;
1)
  createDemo "01"
  ;;
3)
  createDemo "03"
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
