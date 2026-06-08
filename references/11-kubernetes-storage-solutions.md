---
date: 2026-06-08
tags: [ website, reference, kubernetes, kubernetes-storage ]
url: https://overcast.blog/11-kubernetes-storage-solutions-you-should-know-8b22ee51c62f
---

# 11 Kubernetes Storage Solutions You Should Know

A blog post about storage in the [[kubernetes]] ecosystem.

## Solutions

### Kubernetes persistent volumes and Persistent volume claims

These are built-in storage definitions in [[kubernetes]].
Manually defining these is the most basic option to integrate storage within your cluster.

### NFS

This is essentially a local file share, but with a remote server linking this share over the `NFS` protocol.

### Cloud-based storage solutions

These are options from each cloud provider for network shares which are hosted by the provider.
They barely differ between each provider and you should choose the one where your other resources already are.

- Amazon EBS
- Google Persistent Disks
- Azure Managed disks

### Portworx

### OpenEBS

### Rook

### Longhorn

### Ceph RBD

TODO

### GlusterFS

TODO

## References

<https://overcast.blog/11-kubernetes-storage-solutions-you-should-know-8b22ee51c62f>
