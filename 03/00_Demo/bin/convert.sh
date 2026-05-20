#!/bin/bash
#
# dos2unix as tool is required on your target node!
# To install this tool type:
# sudo apt install dos2unix
#
# add path to .bash_profile
##!/bin/bash
# export PATH=$PATH:~/bin
#
CMD="dos2unix"
echo "Checking ${CMD} installation ..."
if command -v ${CMD} &> /dev/null; then
    VER=$(${CMD} --version)
    echo "${CMD} version ${VER} is installed!"
else
    echo "${CMD} installation not found. Installing now ..."
    sudo apt install dos2unix
fi

echo "Convert now CRLF (Windows) to LF (Unix) ..."
find . -name "*.sh" -exec dos2unix {} \;
find . -name "*.conf" -exec dos2unix {} \;
find . -name "*Dockerfile" -exec dos2unix {} \;