#!/bin/bash
#
# set docker file name
dockerfile="Dockerfile1"
# set image name
image="demo3image"
# set container name
container="demo3"

# if docker file does not exist ..
if [ ! -f "${dockerfile}" ]; then
  # print error message and exit script
  echo "Error: ${dockerfile} not found!"
  exit 1
fi

# 1. Build a dockerfile with tag -t
docker build -f "${dockerfile}" -t "${image}" .

# 2. List images
docker images

# 3. Run image and name it demo3
docker run --name "${container}" -d "${image}"

# 4. Start bash-shell in container
docker exec -it "${container}" /bin/bash