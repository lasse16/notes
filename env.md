---
date: 2026-05-20
tags: [ bash, cli ]
---

# env: one-off modified environment

This is something I just stumbled across.

One can use `env` to modify environment variables for a single command, e.g. `env "TEST=HELLO" echo $TEST`.
The next command will not have the environment variable set.
Also by escaping the names, one can use hyphens in the name of the environment variable.

## References

`man env`
