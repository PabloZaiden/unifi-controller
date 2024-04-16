#!/usr/bin/env bash

set -e

UNIFI_VERSION=$(cat version.txt)

echo "Repository version: $UNIFI_VERSION"

LATEST_VERSION=$(curl -sX GET http://dl-origin.ubnt.com/unifi/debian/dists/stable/ubiquiti/binary-amd64/Packages \
    |grep -A 7 -m 1 'Package: unifi' \
    | awk -F ': ' '/Version/{print $2;exit}' \
    | awk -F '-' '{print $1}')

echo "Latest version: $LATEST_VERSION"

if [ "$UNIFI_VERSION" == "$LATEST_VERSION" ]; then
    echo "Repository version is up to date"
    exit 0
else
    echo "Repository version is outdated"
    exit 1
fi