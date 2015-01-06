#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install puppet git -y

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install nodejs -y

puppet module install dwerder-graphite
puppet module install jdowning-statsd

git clone -b trusty https://github.com/sidearmsports/vagrant-statsd-graphite-puppet.git statsd

pushd statsd/puppet

sudo puppet apply manifests/base.pp