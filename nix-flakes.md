---
date: 2026-05-25
tags: [ nix ]
---

# Nix: Flakes

Flakes are an experimental feature of [Nix](nix-basics).

A flake is any directory with a `flake.nix` file in it.
The intention behind flakes is making all inputs explicit, and as such increase reproducibility and readibility.

Previously, nix relied on channels, which were settings on operating system level.
This obfuscated dependencies unless you knew where to look.

Flakes have been widely accepted in the community, but are still an experimental feature.

## Flake templates

There are common templates, which can be used with `nix flake init -t <template-url>`.
Some are bundled with Nix per default.
Use these like `nix flake init -t templates#full`

Use `nix flake show templates` to see the available templates.

Find my templates as part of my dev envs repository at <https://github.com/lasse16/dev-envs>.

## Flakes are still experimental ?

<https://nixos-and-flakes.thiscute.world/nixos-with-flakes/introduction-to-flakes#when-will-flakes-be-stabilized>

## Flake structure

A flake is a file, which takes an input set and returns an output set.
Some fields of this output set have specific interactions with other parts of the nix ecosystem.

<https://nixos-and-flakes.thiscute.world/other-usage-of-flakes/outputs> has a good overview of the outputs and their usefulness.
Inputs tend to be urls, which include some [helpers for frequently used locations and protocols][flake-inputs].

## [NixOS](nixos) with Flakes

Nixos can be managed with its configuration in flakes.
Use `sudo nixos-rebuild switch --flake <flake-directory>`.

## References

- <https://nixos-and-flakes.thiscute.world/nixos-with-flakes/introduction-to-flakes>
- [flake-inputs]

[flake-inputs]: https://nixos-and-flakes.thiscute.world/other-usage-of-flakes/inputs
