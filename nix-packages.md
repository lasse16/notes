---
date: 2026-05-25
tags: [ nix, nixos ]
---

# [[nix-basics]]: Packages

A package in the nix ecosystem is a expression, which takes a set of five preconfigured inputs.

```nix
{lib, config, options, pkgs, ...}:
{
  # Importing other Modules
  imports = [
    # ...
    ./xxx.nix
  ];
  for.bar.enable = true;
  # Other option declarations
  # ...
}
```

There is a large repository, which collects packages for programs installable on nix: <https://github.com/nixos/nixpkgs>.

## References

- <https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-flake-and-module-system>
