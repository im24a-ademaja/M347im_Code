#!/bin/bash
#
# Load configuration
CONF="param.conf"
if [ -f "$CONF" ]; then
    printf "%s does not exist.\nExit script!" ${CONF}
    exit 1
fi
# import configuration
source ${CONF}
# Build a dockerfile with tag -t
docker build -t ${image} -f ${file} .
# List images
docker images
# Run image with specific name
docker run -itd --rm --name ${container} -p : 5000:5000 ${image}
# List containers
