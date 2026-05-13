---
date: 2026-05-13
tags: [ kubernetes, cli ]
---

# kubectl: custom subcommands

The [[kubectl]] cli allows you to define additional subcommands via its [plugin mechanism][kubectl-plugin].

In essence, define any executable script with the prefix `kubectl-<subcommand>` and add it to `$PATH`.
This will then be executable as a subcommand ala `kubectl <subcommand>`.
These scripts do not have to be [[bash]] and can be any executable binary.
There is a [Go library with cli helpers](https://github.com/kubernetes/cli-runtime) for custom executables.

One can also see all accessible plugins via `kubectl plugin list`.

There is also [[krew]], which is is a plugin manager for these executable scripts.

In my dotfiles are various examples of custom subcommands.

## [Limitations][plugin-limitations]

It is currently not possible to overwrite any built-in commands other than `kubectl create`.
`create` also only allows additional subcommands, ala `kubectl-create-new`.
Any other executables are ignored.

## Details

All flags and arguments are passed in their original order to the script.
Additionally, the first argument that is passed to a plugin will always be the full path to the location where it was invoked.

An underscore `_` in the file name will evaluate to both, a dash `-` and an underscore `_`, in the subcommand, and can hence be called via `kubectl sub-command` or `kubectl sub_command`.

## References

- [kubectl-plugin]
- [plugin-limitations]

[kubectl-plugin]: <https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/>
[plugin-limitations]: <https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/#limitations>
