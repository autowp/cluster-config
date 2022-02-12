#!/bin/sh

kubectl -n gitlab apply -f pv.yaml
kubectl -n gitlab apply -f s3-backup.secret.yaml
kubectl -n gitlab apply -f gitlab-keycloak-oidc.secret.yaml

helm -n gitlab upgrade --install gitlab gitlab/gitlab -f values.production.yaml