---
date: 2026-06-08
tags: [ website, reference, todo, homelab, kubernetes, secrets ]
url: https://www.jonashietala.se/blog/2026/05/31/sops_age_and_sealed_secrets/
---

# Jonas Hietala: SOPS + Age and Sealed Secrets

This is a blog post about secrets in a [[kubernetes]] homelab with a [[gitops]] setup.

It uses the [[references/github-bitnami-labs-sealed-secrets-a-kubernetes-controller-and-tool-for-one-way-encrypted-secrets-github]] and [[references/sops-secrets-operations]] to create encrypted secrets, which are safe to commit.

The trouble with the sealed secrets operator, is that it can only manage secrets once they are in [[kubernetes]], any bootstrapping secrets must be handled elsewhere.
This includes the initial secret to spin up the operator, as well as configuring access to the [[git]] repo in the first place.
It also includes any certificates or machine-specific configuration, like the [[talos-os]] configuration.

At this point, [[references/sops-secrets-operations]] is used to encrypt the secrets.

Storing these secrets on anything hosted in-cluster, like a self-hosted [[vaultwarden]] instance, is obviously a bad idea as once your cluster goes down, you lock yourself out entirely.

## References

<https://www.jonashietala.se/blog/2026/05/31/sops_age_and_sealed_secrets/>
