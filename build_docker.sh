#!/bin/bash

IMAGE=opera/dswx-s1
t=IF_v1
echo "IMAGE is $IMAGE:$t"

# fail on any non-zero exit codes
set -ex

python3 setup.py sdist

# build image
docker build --rm --force-rm --network=host -t ${IMAGE}:$t -f docker/Dockerfile .

# create image tar
docker save opera/dswx-s1 > docker/dockerimg_dswx_s1_$t.tar

# remove image
docker image rm opera/dswx-s1:$t    