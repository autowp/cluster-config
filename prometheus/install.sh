#!/bin/bash

set -e

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm -n monitoring upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack -f values.yaml -f values-production.yaml
