---
date: 2026-02-19
tags: [ cat1, cat2, cat3 ]
---

# Neovim: Custom hover for LSP

There are multiple LSP servers which provide diagnostics for viewing in-editor withing a pop-up window, but have a
remote website per diagnostic which explains the diagnostic in more detail.

I find myself often needing to see the proper explanation and looking for a hotkey to open the remote page.

`Rusteacean.nvim` provides a command `:RustLSP openDocs` to view the remote website for diagnostics.

<https://github.com/chrisgrieser/nvim-rulebook> does support this :D

## Known remote websites

### Rumdl

Rumdl supports extended documentation for diagnostics at `rumdl.dev/<rule>/`, e.g. `rumdl.dev/md031/`.

### Shellcheck

## References
