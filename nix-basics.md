---
date: 2026-03-12
tags: [ nix, todo ]
---

# Nix: Basics

<https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/>
<https://nix.dev/>
<https://zero-to-nix.com/>

## Tools

<https://search.nixos.org/packages>
<https://lazamar.co.uk/nix-versions/>
<https://noogle.dev/>
<https://nixpk.gs/pr-tracker.html>
<https://github.com/nix-community/nix-init>
<https://github.com/nix-community/nurl>

## Integrations

### Github Actions

- <https://nix.dev/guides/recipes/continuous-integration-github-actions#github-actions>
- <https://garnix.io/>

### Python

- <https://nixos.org/manual/nixpkgs/stable/#python>
- <https://nix.dev/guides/recipes/python-environment.html>
- <https://pyproject-nix.github.io/pyproject.nix/introduction.html>

### Docker

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

## References

- <https://nix.dev/guides/recipes/python-environment.html>
- <https://pyproject-nix.github.io/pyproject.nix/introduction.html>
