# QRify Platform – Cluster State

This repository manages the declarative state of all Kubernetes applications and environment-specific configurations for the QRify platform. It follows GitOps principles using ArgoCD to continuously reconcile the desired state with what is deployed in the cluster.

---

## 📦 Repository Structure

- Each app has its own Helm chart directory.
- Environment-specific overrides live in values.dev.yaml and values.prod.yaml.

---

## 🚀 Deployment via ArgoCD

ArgoCD watches this repository and manages application deployments to the appropriate Kubernetes namespaces based on environment.

Example ArgoCD Application definition:

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: qrify-web-dev
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/QRify-platform/cluster-state
    targetRevision: main
    path: apps/qrify-web
    helm:
      valueFiles:
        - values.dev.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: dev
  project: default
  syncPolicy:
    automated: {}

A similar application would be defined for qrify-web-prod using values.prod.yaml and the prod namespace.

---

## 🔐 Permissions

This repository does not contain secrets and does not require AWS access.

- All deployments are handled by ArgoCD running inside the Kubernetes cluster.
- Secrets are injected via environment-specific configurations (e.g. external-secrets, sealed secrets, etc).

---

## 🧠 Best Practices

- Use Pull Requests to make changes to the desired state.
- Keep shared defaults in values.yaml.
- Avoid storing secrets or credentials in this repository.
- Keep environments separated using namespaces and separate values files.

---

## 📚 Related Repositories

- qrify-web – Frontend application
- qrify-api – Backend FastAPI service
- infra – Terraform infrastructure (EKS, ECR, IAM, etc.)
- github-actions – Reusable GitHub composite actions

---

Inspired by GitOps and Kubernetes platform best practices.
