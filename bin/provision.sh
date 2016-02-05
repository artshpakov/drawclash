#!/usr/bin/env bash

set -e

# Installing Docker
wget -q -O - https://get.docker.io/gpg | apt-key add -
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -q -y --force-yes lxc-docker
curl -L https://github.com/docker/compose/releases/download/1.6.0/run.sh > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

cd /drawclash

# Assemble containers & initialize DB
docker-compose up
docker-compose run web /drawclash/bin/setup
