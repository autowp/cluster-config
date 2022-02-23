#!/bin/bash

set -e

helm -n db upgrade --install --create-namespace db . -f values-production.yaml
