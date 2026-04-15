---
date: 2026-01-12
tags: [ vim, neovim, git ]
---

# Vim: Tricks

## Fugitive

`:Git ++curwin -p commit` ? - Only works when no changes are present, otherwise fugitive fails due to "use of pager"
`:Git mergetool` and `:Git difftool`

## Practical Vim, 2nd edition

What I have taken away from reading this book.

`<C-r><C-p>` is the same as `<p>` in normal mode.
`<C-r>=` is the expression register and pastes in the evalutation of the vimscript expression entered in that register.
> [!NOTE]
> Does this include `lua` in Neovim?

## References

- <https://github.com/tpope/vim-fugitive>
