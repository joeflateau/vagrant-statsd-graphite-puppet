#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install puppet git -y

git clone https://github.com/sidearmsports/vagrant-statsd-graphite-puppet.git statsd

pushd statsd/puppet

sudo puppet apply --modulepath modules manifests/base.pp