---
date: 2026-06-08
tags: [ website, reference, todo, kubernetes, gitops, secrets ]
url: https://github.com/bitnami-labs/sealed-secrets
aliases: ["sealed secrets", "sealed secrets operator"]
---

# bitnami-labs/sealed-secrets: A Kubernetes controller and tool for one-way encrypted Secrets

This is an operator for encrypting secrets, such that they can be stored in a [[git]] repo, and follow a [[gitops]] deployment setup.

It decrypts a `SealedSecret` [[crd]] into a standard [[kubernetes]] secret.

To create a `SealedSecret`, you need to use their client-side [[glossary/cli]] `kubeseal`.

## Cluster reset

If not careful, the operator will create a new private/public key combination, hence invalidating all existing sealed secrets.

For this case, it is best to store the private key outside the cluster and import it on every restart.
Treat this private key as an external bootstrapping secret.

## References

<https://github.com/bitnami-labs/sealed-secrets>
