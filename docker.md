---
date: 2026-05-04
tags: [ docker, cloud-native ]
alias: ["Docker"]
---

# Docker

The container runtime, that made itself the standard of the earlier container days.

It runs a daemon in the background, that is always accessible via a socket.
This decision has defined the API of most tooling around containers.

Alternatives, like [[podman]] do not run a daemon unless specifically calling the compatibilty option.

There are licensing issues around docker desktop, as they request a paid license if your company has an annual revenue higher than 100_000$.

## References

- <https://www.docker.com/>
