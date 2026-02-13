---
date: 2026-01-12
tags: [ vim, neovim, git ]
---

# Vim: Fugitive tricks

`:Git ++curwin -p commit`  ?  - Only works when no changes are present, otherwise fugitive fails due to "use of pager"
`:Git mergetool` and `:Git difftool`

## References
- <https://github.com/tpope/vim-fugitive>
