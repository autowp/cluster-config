#!/bin/sh

set -e

helm -n keycloak upgrade --install keycloak codecentric/keycloak -f values.yaml -f values-production.yaml --create-namespace
