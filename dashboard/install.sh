#!/bin/bash

kubectl create serviceaccount dashboard-admin-sa
kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa

kubectl get secrets
kubectl describe secret dashboard-admin-sa-token-xxxxx
