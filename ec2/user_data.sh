#!/bin/bash
set -e -x
sudo locale-gen pt_BR.UTF-8
sudo apt-get update 
sudo apt-get install -y python-minimal python-simplejson

