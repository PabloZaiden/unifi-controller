#!/usr/bin/env bash

chown -R unifi:unifi /var/lib/unifi
chown -R unifi:unifi /var/log/unifi
chown -R unifi:unifi /var/run/unifi

service unifi start

sleep 5

logdir=/var/log/unifi

tail -f "$logdir/server.log"