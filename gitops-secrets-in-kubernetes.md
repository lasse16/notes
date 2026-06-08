---
date: 2025-10-02
tags: [ todo, kubernetes, gitops, secrets ]
---

# GitOps: Secrets in Kubernetes

external secrets operator

## [[references/bitnami-sealed-secrets]]

### Problems

#### Bootstrapping secrets

The trouble with the sealed secrets operator, is that it can only manage secrets once they are in [[kubernetes]], any bootstrapping secrets must be handled elsewhere.
This includes the initial secret to spin up the operator, as well as configuring access to the [[git]] repo in the first place.
It also includes any certificates or machine-specific configuration, like the [[talos-os]] configuration.

#### Cluster restart

If not careful, the operator will create a new private/public key combination, hence invalidating all existing sealed secrets.

For this case, it is best to store the private key outside the cluster and import it on every restart.
Treat this private key as an external bootstrapping secret.

## References

- <https://www.harness.io/blog/gitops-secrets>
- [[references/jonas-hietala-sops-age-and-sealed-secrets]]
