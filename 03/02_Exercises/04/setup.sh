#!/bin/bash
#
# Load configuration
CONF="param.conf"
if [ ! -f "$CONF" ]; then
    printf "%s does not exist.\nExit script!\n" "$CONF"
    exit 1
fi

# import configuration
source "$CONF"

# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" .

# List images
docker images

# Run the Docker container with auto-restart policy
docker run -d --restart unless-stopped --name "$container" -p 3000:3000 "$image"

docker ps
