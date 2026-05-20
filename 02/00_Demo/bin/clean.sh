#!/bin/bash
#
TEMP=tmp.sh
# if no argument has been provided
if test $# -lt 1;then #??
  # then show an error message and exit the script with error code 1
  echo "Error: One file argument is required!"  #??
  echo "Exit script."  #??
  exit 1  #??
fi  #??

pattern=$1

declare -a fileArray=($(ls "$pattern"))
for file in "${fileArray[@]}"
do
  echo "Removing #?? in ${file} ..."
  cp -f ${file} ${TEMP}
  cat ${TEMP} | sed 's/ #??//' > ${file}
done
rm ${TEMP} 2>/dev/null