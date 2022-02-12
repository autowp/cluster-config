#!/bin/bash

set -e

helm -n ceph upgrade --install --create-namespace ceph . --create-namespace -f values-production.yaml
