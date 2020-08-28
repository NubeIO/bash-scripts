#!/bin/bash
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

node -v

git clone --depth 1 https://github.com/NubeIO/bbb-py-rest.git

pushd bbb-py-rest
    git status
popd
rm -r bbb-py-rest
# sudo reboot now