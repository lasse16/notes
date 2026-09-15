---
date: 2026-09-15
tags: [ bash ]
type: Note
---

# [[bash-bourne-again-shell|bash]] Subshell with file-descriptor

Bash allows spawning subshells to run commands.
If you want the output not via standard input, but a file-descriptor, use `<()`.

This is useful for sourcing completion scripts from subcommands, e.g. `source <(mdslw --completion bash)`.

## References

- <https://devopsbeast.com/courses/bash-scripting/bash-parsing/command-substitution-subshells>
