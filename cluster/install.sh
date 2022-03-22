#!/bin/bash

set -e

helm -n kube-system upgrade --install cluster . -f values.production.yaml

kubectl describe secret dashboard-admin-sa-token-xxxxx
