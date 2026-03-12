---
date: 2026-03-04
tags: [ rust, github, todo, nix ]
---

# Rust: Writing Github Actions

- Must be Dockerimage
- `Dockerfile` must be present, because `runs.image` only allows pulling from public registry, so we need `image: Dockerfile` [see more here][runs-for-container-actions]
- [Various restrictions][dockerfile-actions] on what is allowed in the `Dockerfile`

## Rust

- GH API requests via [OctoCrab][octocrab]
- Helper library with [42ByteLabs/ghactions][actions-helper-library]
    offers an Actions struct and derive macros to go from struct field to input when generating the `action.yml`
    can generate `action.yml`
    initialises a logger with syntax and macros for github actions ( logger originally comes from [log crate](https://docs.rs/log/latest/log/) ) -- <https://docs.rs/ghactions/latest/ghactions/fn.init_logger.html>
        log level can be parsed from string -- <https://docs.rs/log/latest/log/enum.Level.html#impl-FromStr-for-Level>

## Nix

**Caching ?**

### What to build?

1. Binary
2. Container image with binary
3. (optional) Builder container image capable of building the binary
4. !!! HOW TO PUSH INTO REGISTRY WHEN NO DOCKER IS PRESENT -> [skopeo]

- Naersk for building Rust package
    naersk creates two derivations, one containing dependencies and another with the compiled package
    TODO: can we wrap each derivation as a docker image, so we have a separate `builder` image.

#### Build images and dependencies with Nix

- how to get nix to build a docker image.
  - `pkgs.dockerTools`

  built into Nixpkgs, usually used to build a tar archive and then `docker load` it into Docker before pushing it into registry.
  Here is an example on how to build the tarball <https://github.com/aksiksi/ncdmv/blob/aa108a1c1e2c14a13dfbc0407f7f595ca205a4f6/flake.nix#L69>
  and here is an example on how to load and push it into registry <https://github.com/aksiksi/ncdmv/blob/aa108a1c1e2c14a13dfbc0407f7f595ca205a4f6/.github/workflows/package.yml#L18>

  - `nix2container`
    why is it needed ? <https://lewo.abesis.fr/posts/nix-build-container-image/>
    Dockertools requires the archive to be stored in the nix store.
    Each layer needs to be stored separately, but will only be a thin wrapper around a derivation already present in nix store anyway.

#### Build images with Docker and dependencies per Nix

<https://mitchellh.com/writing/nix-with-dockerfiles>

#### Hosting Docker image reachable by Actions

[Github Packages](https://docs.github.com/en/packages/learn-github-packages/introduction-to-github-packages) have the advantage that by specifying the `packages:read` permission, authentication for private Actions is handled.
It has a Container registry available <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>.

TODO: Is this to attach additional metadata ? <https://docs.github.com/en/code-security/concepts/supply-chain-security/linked-artifacts>

## References

- [Octocrab: Typed API interactions for Github][octocrab]
- [Examples for `action.yml` for container Actions][runs-for-container-actions]
- [Reddit Post asking about Nix and Docker experiences](https://www.reddit.com/r/NixOS/comments/1gg4d2e/anyone_using_nix_to_build_docker_images/)

[runs-for-container-actions]: <https://docs.github.com/en/actions/reference/workflows-and-actions/metadata-syntax#runs-for-docker-container-actions>
[octocrab]: <https://crates.io/crates/octocrab>
[dockerfile-actions]: <https://docs.github.com/en/actions/reference/workflows-and-actions/dockerfile-support>
[skopeo]: <https://github.com/containers/skopeo>
[actions-helper-library]: <https://github.com/42ByteLabs/ghactions>
