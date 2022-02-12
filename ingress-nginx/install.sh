#!/bin/sh

helm -n ingress-nginx install ingress-nginx nginx-stable/nginx-ingress -f values-production.yaml