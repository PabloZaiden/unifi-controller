#!/usr/bin/env bash

set -e

# if the image name is not set, set it to unifi-controller
if [ -z "$IMAGE_NAME" ]; then
    IMAGE_NAME="unifi-controller"
fi

docker run \
    --rm \
    -ti \
    -p 8443:8443 \
    -p 38473:3478/udp \
    -p 10001:10001/udp \
    -p 8080:8080 \
    -p 1900:1900/udp \
    -p 8843:8843 \
    -p 8880:8880 \
    -p 6789:6789 \
    -p 5514:5514/udp \
    -v $(pwd)/unifi/data:/var/lib/unifi \
    -v $(pwd)/unifi/logs:/var/log/unifi \
    $IMAGE_NAME
    