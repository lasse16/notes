---
date: 2025-04-10
tags: [ homelab, kubernetes, devops ]
---

# homelab

## Setup

[[talos-os]] on new Chuwi LarkBox X.
-> [[kubernetes]]
-> [[kustomize]]

## Services

Setup:
[[glance]] dashboard as home page

Inspiration:
<pocket-id.io>
<https://github.com/louislam/uptime-kuma>
<https://cert-manager.io/docs/>
<https://github.com/gruberdev/homelab>

## More

Wanted to setup pocket-id, but it required a secure context, so a reverse proxy and certificate must be first.
Certificates mean [[cert-manager]] and reverse proxy means [[kubernetes-ingress-controller]].
Ingress controller require full-cluster access which is usually done by a custom role.




## References
[Xe Iaso's overprovisioned homelab](https://xeiaso.net/talks/2025/surreal-joy-homelab/)
