#!/bin/bash
# 5. Stoppen Sie den laufenden Container
# 6. Löschen anschliessend das Image und überprüfen Sie die Löschung
# set variables for teardown
CONF="param.conf"
TD="../bin/td-base.sh"

# loop through item and check if exists
for item in $CONF $TD
do
  if [ ! -f "$item" ]
    then
      printf "%s does not exist.\nExit script!" ${item}
      exit 2
    fi
    source ${item}
done
# Import configurations and code
    source ${item} 1
done