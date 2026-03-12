---
date: 2026-02-13
tags: [nushell, cli, todo]
---

# Nushell: Basics

I have been stumbling across NuShell quite a lot of times now, and I like its approach to use proper data-exchange formats between commands.

What stopped me so far?

- Migration cost
- No bash compatibility, i.e. ssh agent setup, keybindings etc.
- Github Runners still use bash, so still need yq for yaml parsing etc.

Starship is usable in both.

## Basics

Everything* outputs a table instead of strings.
Tables can be indexed by name, schema etc.
`describe` command to get the schema of a table.

Everything has a return value even if it is `null`.
Last return value is printed ( "Rust-like").

## References

- [NuShell: Official page](https://www.nushell.sh/)
