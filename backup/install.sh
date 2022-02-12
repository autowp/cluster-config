#!/bin/bash

set -e

helm -n backup upgrade --install --create-namespace backup . -f values-production.yaml