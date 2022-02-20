#!/bin/sh

helm -n ingress-nginx install ingress-nginx nginx-stable/nginx-ingress -f values.yaml

helm -n ingress-nginx upgrade --install ingress-nginx ingress-nginx/ingress-nginx -f values.yaml