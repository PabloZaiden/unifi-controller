#!/usr/bin/env bash

set -e

# mongo dir
mkdir -p /data/db

apt update
apt install -y \
    wget \
    ca-certificates \
    apt-transport-https \
    gnupg \
    binutils \
    libcap2 \
    curl

wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | apt-key add -
echo "deb [trusted=yes] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/3.6 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list

apt-get update

apt-get install -y \
    mongodb-server \
    openjdk-17-jre-headless \
    logrotate

echo "Installing Unifi Controller version $UNIFI_VERSION"
wget https://dl.ui.com/unifi/$UNIFI_VERSION/unifi_sysvinit_all.deb

dpkg -i unifi_sysvinit_all.deb