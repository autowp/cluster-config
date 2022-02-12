#!/bin/bash

helm -n kube-state-metrics upgrade --install --create-namespace kube-state-metrics . -f values-production.yaml
