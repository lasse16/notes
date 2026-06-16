---
date: 2026-06-09
tags: [ neovim-0.12, neovim, todo ]
---

# Neovim: 0.12 upgrade

This release has the new `vim.pack` package manager and the new experimental `ui2` user interface.
There are also some more improvements to supported `lsp` requests.

The release correlates with the archival of `nvim-treesitter`, so there is another blog post coming about how i migrated from it.

[Full neovim news changelog][neovim-news]

- `vim.pack` | Native plugin manager
- experimental ui | `ui2`
- built-in plugins: UndoTree, DiffTool
  - toHTML move to opt-in plugin
- MISC
  - new commands, like `:restart` or `:connect`
  - treesitter bindings | `v_an`, `v_in`, with fallback to lsp `selectionRange`
  - native completion in insert mide `vim.o.autocomplete`

## vim.pack

[[references/a-guide-to-vim-pack-neovim-built-in-plugin-manager-evgeni-chasnovski]]

`vim.pack.add()`
`vim.pack.update()`
Pass `nil` on update to auto-update all plugins.

```lua
vim.pack.add({
        'https://github.com/sainnhe/gruvbox-material',
        'https://github.com/nvim-treesitter/nvim-treesitter',
        {
            src = 'https://github.com/neovim/nvim-lspconfig',
            version = 'v2.0.0',
            name = "lsp-config",
        },
    })
```

lockfile is at `~/.config/nvim/nvim-pack-lock.json` and plugins will be installed at `site/pack/core/opt`.

local directory revision is not checked against version, only on download, or update.

## experimental `ui2`

`require('vim._core.ui2').enable({})`

It is supposed to avoid `Press ENTER` interruptions, highlight the command line as you type and expose the pager as a buffer/window.

## built-in plugins

`:DiffTool`, `:UndoTree` are now built-in, but still opt-in.

`:TOhtml` has moved into opt-in and must be enabled with `:packadd nvim.tohtml`

## MISC

Insert mode `<C-r>` now inserts like `:put` instead of interpreting the text.
This behaviour was previously achievable, see [[vim-tricks-review]].

New highlight group for popup-menu: `PmenuBorder` and `PmenuShadow`.

`gx` in help buffer, opens the online documentation for that help tag.

`checkhealth` is now an addressable file type.

### Commands

Some new commands are built-in, like `:connect`, or `:restart`, or `:uniq`.

`:iput` to put, but with proper indentation.

`:wall ++p` writes all buffers and creates missing directories.
`:help!`, like normal help but with smarter tag guessing.

### LSP

- `gx` supports `textDocument/DocumentLink`
- `:lsp` allows manual attaching, interactive client management
- `gO` is now the default for document symbols
- various other protocol implementations

Some features are opt-in, like inlay hints, code lens or in-line completion.

### New API

There are now two helper functions for showing diagnostics and lsp status `vim.diagnostic.status()` and `vim.lsp.status()`.
These are meant to be used as components in a status bar.

`vim.net.request()` for `HTTP` requests.
`vim.fs.ext()` to get file extenstion
`vim.list.unique` to deduplicate lists.
`vim.version` for various semantic versioning tasks

### Treesitter

Now has node-based selection built-in, handle it like a text-object with the `n` prefix.
Example: `v_in` select inner node, `v_]n` select next node

### Diagnostics

`:sign_define` and `sign_define()` are deprecated, use `vim.diagnostic.config`

## References

- [neovim-news]
- [[references/adib-hanna-neovim012-whats-new]]
- [[references/a-guide-to-vim-pack-neovim-built-in-plugin-manager-evgeni-chasnovski]]
- [[references/refreshing-your-neovim-config-for-0-12-0]]
- <https://www.youtube.com/watch?v=xSiQP23ZZhI>
- <https://neovim.io/doc/user/deprecated/#_deprecated-in-0.12>

[neovim-news]: [[references/neovim-0_12]]
