---
date: 2026-06-08
tags: [ bash, cli ]
---

# Bash: `until`

[[bash]] has a lot of built-in commands, and a lot of these are shared with other programming languages.

I just discovered the `until` command as the counterpart to the `while` command.

```man
until <list-1>; do <list-2>; done
    The while command continuously executes the list list-2 as long as the last command in the list list-1 returns an exit status of zero.  The until command is identical to the
    while command, except that the test is negated: list-2 is executed as long as the last command in list-1 returns a non-zero exit status.  The exit status of  the  while  and
    until commands is the exit status of the last command executed in list-2, or zero if none was executed.
```
