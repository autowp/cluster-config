project: autowp
version: 1.0.0

repositories:
  - name: jetstack
    url: https://charts.jetstack.io
  - name: metrics-server
    url: https://kubernetes-sigs.github.io/metrics-server/
  - name: kubernetes-dashboard
    url: https://kubernetes.github.io/dashboard/
  - name: ingress-nginx
    url: https://kubernetes.github.io/ingress-nginx
  - name: prometheus-community
    url: https://prometheus-community.github.io/helm-charts
  - name: codecentric
    url: https://codecentric.github.io/helm-charts

releases:
  - name: cert-manager
    namespace: cert-manager
    chart:
      name: jetstack/cert-manager
    values:
      - cert-manager-values.yaml
    options:
      install: true
      create_namespace: true

  - name: cert-manager-cluster-issuer
    namespace: cert-manager
    depends_on:
      - cert-manager@cert-manager
    chart:
      name: cert-manager-cluster-issuer
    options:
      install: true

  - name: metrics-server
    namespace: kube-system
    chart:
      name: metrics-server/metrics-server
    values:
      - metrics-server-values.yaml
    options:
      install: true

  - name: kubernetes-dashboard
    namespace: kube-system
    chart:
      name: kubernetes-dashboard/kubernetes-dashboard
    depends_on:
      - ingress-nginx@ingress-nginx
    values:
      - kubernetes-dashboard-values.yaml
      - kubernetes-dashboard-values.production.yaml
    options:
      install: true

  - name: ingress-nginx
    namespace: ingress-nginx
    chart:
      name: ingress-nginx/ingress-nginx
    values:
      - ingress-nginx-values.yaml
    options:
      install: true

  - name: ceph
    namespace: ceph
    chart:
      name: ceph
    depends_on:
      - ingress-nginx@ingress-nginx
    values:
      - ceph-values.production.yaml
    options:
      install: true

  - name: backup
    namespace: backup
    chart:
      name: backup
    values:
      - backup-values.production.yaml
    options:
      install: true

  - name: kube-prometheus-stack
    namespace: monitoring
    chart:
      name: prometheus-community/kube-prometheus-stack
    values:
      - prometheus-values.yaml
      - prometheus-values.production.yaml
    options:
      install: true

  - name: keycloak
    namespace: keycloak
    chart:
      name: codecentric/keycloak
      version: 17.0.3
    values:
      - keycloak-values.yaml
      - keycloak-values.production.yaml
    options:
      install: true