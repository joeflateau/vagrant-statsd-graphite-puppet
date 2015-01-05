#!/bin/bash

sudo apt-get update -y

sudo apt-get install puppet git -y

git clone https://github.com/sidearmsports/vagrant-statsd-graphite-puppet.git statsd

pushd statsd/puppet

sudo puppet apply --modulepath modules manifests/base.pp