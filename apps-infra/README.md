# apps-infra

Platform addons managed by Argo CD (not Terraform Helm releases).

| App | Path | Notes |
|---|---|---|
| Argo Rollouts | `argo-rollouts/` | Progressive delivery + dashboard LB |
| External Secrets | `external-secrets/` | ESO Helm + `ClusterSecretStore` |
| ExternalDNS | `external-dns/` | Route53 records from Ingress/Service hostnames |

AWS pieces that stay in Terraform: EKS, Argo CD bootstrap, ingress controller + ACM (for now), IRSA roles (`QRifyExternalSecretsRole`, `QRifyExternalDNSRole`).

App hostname DNS: prefer ExternalDNS (sync policy). TF Route53 aliases on the ingress module should be removed once ExternalDNS is live so they don’t fight.

Product workloads live under `apps/`.
