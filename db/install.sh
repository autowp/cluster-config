#!/bin/bash

set -e

helm diff -n db upgrade --install db . -f values-production.yaml
