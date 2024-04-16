#!/usr/bin/env bash

set -e

# if the version is not set, read it from version.txt
if [ -z "$UNIFI_VERSION" ]; then
    UNIFI_VERSION=$(cat version.txt)
fi
echo "Building Unifi Controller version $UNIFI_VERSION"

# if the image name is not set, set it to unifi-controller
if [ -z "$IMAGE_NAME" ]; then
    IMAGE_NAME="unifi-controller"
fi
echo "Image name is $IMAGE_NAME"

docker build --build-arg UNIFI_VERSION=$UNIFI_VERSION -t $IMAGE_NAME .