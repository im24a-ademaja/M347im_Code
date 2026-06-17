#!/bin/bash
#

# jq is the safest and cleanest way to build JSON in shell scripts.
# This avoids issues with escaping quotes and special characters in user input.
# It ensures the JSON is valid, even if the user enters special characters or spaces.
function install_package() {
  local CMD=$1
  echo "Checking ${CMD} installation ..."
  if command -v ${CMD} &> /dev/null; then
      VER=$(${CMD} --version)
      echo "${CMD} version ${VER} is installed!"
  else
      echo "${CMD} installation not found. Installing now ..."
      sudo apt  install ${CMD}
  fi
}

#??
#??
#??
#??

# set HOST variable with IP-address and port
#??
# start with a loop and quit it with a character entered by the user
#??
  # Clear screen
#??
  # Ask user for action and read it
#??
#??
  # show selected action
#??
  # case/switch
#??
  p | post)
#??
#??
#??
#??

#??
#??
#??
#??
#??
#??
  [l] | list)
#??
#??
#??
#??
  [r] | remove)
#??
#??
#??
#??
#??
#??
  [i] | install)
#??
#??
#??
  [q] | quit )
#??
#??
#??
  *)
#??
#??
#??
#??