---
date: 2025-04-22
tags: [ kubernetes ]
---

# Kubernetes Ingress Controller
Backend for Ingresses, essentially a loadbalancer and reverse proxy for cluster-external traffic.
Must be installed extra and there are multiple third-party options, like [[nginx#ingress]] ]] and [[Traefik#ingress]].
Ingresses themselves are scoped to scoped to namespaces and are in the process of being superseded by the newer [Kubernetes API Gateways](./kubernetes-api-gateways.md).

## References
- [Official Kubernetes page](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
- [Traefik's Explanation of Ingress Controllers](https://traefik.io/glossary/kubernetes-ingress-and-ingress-controller-101/)
- [13 Key Considerations When Selecting an Ingress Controller for Kubernetes](https://traefik.io/blog/13-key-considerations-when-selecting-an-ingress-controller-for-kubernetes-d3e5d98ed8b7/?utm_campaign=WP%20-%20Routing%20in%20the%20Cloud&utm_medium=email&_hsmi=78771032&utm_content=78771032&utm_source=hs_automation) 
- [Official setup guide for the Traefik ingress controller](https://doc.traefik.io/traefik/getting-started/quick-start-with-kubernetes/) 
