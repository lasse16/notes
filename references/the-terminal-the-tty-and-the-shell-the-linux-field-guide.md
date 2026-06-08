---
date: 2026-06-09
tags: [ website, reference, bash, cli ]
url: https://lfg.popovicu.com/series/the-shell-as-a-language/terminal-tty-and-shell/
---

# The terminal, the TTY, and the shell - The Linux Field Guide

A post about differentiating between the `$SHELL`, the terminal emulator and the TTY.

A graphical application that draws the window and renders characters. This is the terminal emulator.
A kernel object that acts as the pipe between the emulator and whatever program is running inside it. This is the TTY, or in modern desktop use, a pseudo-terminal (pty).
A userspace program that reads commands you type, parses them, and runs other programs. This is the shell.

## References

<https://lfg.popovicu.com/series/the-shell-as-a-language/terminal-tty-and-shell/>
