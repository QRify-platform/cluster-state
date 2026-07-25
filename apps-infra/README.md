# apps-infra

Platform addons managed by Argo CD (not Terraform Helm releases).

| App | Path | Notes |
|---|---|---|
| Metrics Server | `metrics-server/` | `kubectl top` + HPA resource metrics (`kube-system`) |
| Argo Rollouts | `argo-rollouts/` | Progressive delivery + dashboard LB |
| External Secrets | `external-secrets/` | ESO Helm + `ClusterSecretStore` |
| ExternalDNS | `external-dns/` | Route53 records from Ingress/Service hostnames |
| Prometheus + Grafana | `prometheus-grafana/` | Cluster metrics + dashboards (`monitoring` ns) |
| Loki stack | `loki-stack/` | Logs + Promtail (`logging` ns) |

AWS pieces that stay in Terraform: EKS, Argo CD bootstrap, ingress controller + ACM (for now), IRSA roles (`QRifyExternalSecretsRole`, `QRifyExternalDNSRole`).

App hostname DNS: prefer ExternalDNS (sync policy).

Product workloads live under `apps/`.
