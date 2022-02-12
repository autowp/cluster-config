#!/bin/bash

set -e

sudo docker build . -t autowp/autowp-tools
sudo docker push autowp/autowp-tools