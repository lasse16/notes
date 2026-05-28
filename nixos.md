---
date: 2026-05-24
tags: [ nix, nixos ]
---

# NixOS

This is an operating system, which uses [Nix](nix-basics) to manage its configuration.

Packages can be grabbed from any git repository, but nix community maintains a package repository at <https://search.nixos.org/packages>.

Configuration files are at `/etc/nixos`, and can be used with `sudo nixos-rebuild switch`.

## Flake-based setup

Using a flake-based setup, `sudo nixos-rebuild switch --flake .` can be used and provides a good base for modularity inside the configuration.
There is no need for the flake to live inside `/etc/nixos`, which makes permissions easier as there is no longer a need for `root`.

In order to work for configuration, the output `outputs.nixosConfigurations.<hostname>` must be set.
There is a function in nixpkgs, which makes this easier, `pkgs.lib.nixosSystem`.

The basic example is this flake:

```nix
{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
      ];
    };
  };
}
```

There is nothing going against splitting ones configuration into multiple modules, each imported in the `nixosSystems{ modules }` array.

## References

- <https://nixos.org/>
- <https://search.nixos.org/packages>
- <https://nixos-and-flakes.thiscute.world/nixos-with-flakes/get-started-with-nixos>
