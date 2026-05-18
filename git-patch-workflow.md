---
date: 2026-05-17
tags: [ git ]
---

# Git: patch workflow

GitHub has taken over with its Pull Request-based workflow.

There are alternatives.
The original kernel, uses patches sent per mail.

As [Git](git) was originally designed to be decentralized, these mail-list approaches followed that pattern.

Github however, with the upstream repository, mimicks a centralized workflow.

How many times have you pushed to multiple remotes or sent a patch via mail?
Most common forges all feature this approach.

git offers `git format-patch` to send it via mail.

## Advantages

Patch-based workflows allow for easier analysis on a patch by patch basis.

## References

- <https://www.youtube.com/watch?v=M3l8pbKTFCw>
- <https://www.youtube.com/watch?v=mjYac9SwIK0>
