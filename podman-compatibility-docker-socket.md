---
date: 2026-06-16
tags: [ docker, podman ]
---

# Podman: compatibility with the Docker socket

[[podman]] offers a socket, such that it is compatible with tooling around [[docker]].

To turn the socket on, as podman per default runs without a socket, start the podman service:

`systemctl --user start podman.socket`

Then, set docker to point at that podman socket:

`export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock`

## References

- <https://docs.podman.io/en/latest/markdown/podman-system-service.1.html>
