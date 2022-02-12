#!/bin/bash

set -e

helm repo add jetstack https://charts.jetstack.io

helm -n cert-manager upgrade --install cert-manager jetstack/cert-manager --create-namespace -f values.yaml