---
date: 2026-05-13
tags: [website, kubernetes, reference]
url: https://kubernetes.io/docs/reference/kubectl/
---

# Kubernetes: kubectl

The [[cli]] tool for managing [[kubernetes]] clusters.

It manages which cluster to connect to via contexts.
These contexts are per default stored in `~/.kube/config`.

Contexts can be switched via `kubectl config use-context <context-name>`.
I do this via [[direnv]] at `$WORK`.

Custom subcommands can also be created, see my note about [kubectl: custom subcommands](kubectl-custom-subcommands).

## References

<https://kubernetes.io/docs/reference/kubectl/>
