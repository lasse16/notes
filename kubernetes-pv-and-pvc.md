---
date: 2026-06-09
tags: [ kubernetes, kubernetes-storage, todo ]
---

# Kubernetes: PV and PVC

## Best practises

Define clear storage classes to handle different performance and backup requirements.
Storage Classes provide a way for administrators to describe the “classes” of storage they offer.
Different classes might map to quality-of-service levels, or to backup policies, or to arbitrary policies determined by the cluster administrators.

Use PVCs to abstract the underlying storage implementation from the applications.
This decouples the storage configuration from the application configuration, making your applications more portable and easier to manage.

Regularly monitor and manage PVs and PVCs to avoid storage issues.
This includes checking for unused PVs and PVCs and ensuring that there are enough resources available to meet the storage demands of your applications.

## References

- [[references/11-kubernetes-storage-solutions]]
- <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>
- <https://kubernetes.io/docs/concepts/storage/storage-classes/>
