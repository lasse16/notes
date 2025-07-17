---
date: 2025-07-17
tags: [ kubernetes ]
---

# production cluster services

Services that should be in an optimal cluster

## Secrets
Either external sync via external-secrets.io, or sealed secrets

## Private container registry
Can be pull-through, but a general overview of all images/charts in use in a cluster

## Cert-manager
Mainly https for all ingresses, but automated via cert-manager is a plus

## References
- <https://external-secrets.io/latest/>
