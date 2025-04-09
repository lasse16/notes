---
date: 2025-04-10
tags: []
---

# Neovim Treesitter Highlight Groups

Neovim and Treesitter are married with the [nvim-treesitter]() plugin.

This plugin defines several modules, that handle highlighting, indenting and folding of text.
There are external plugins, that extend the functionality. [List](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins)

Each module can be enabled and configured in a lua file, like `$DOTFILES/nvim/lua/treesitter.lua`.

Currently, only the highlighting module is enabled.
This module defines a set of highlight groups, see `:h nvim-treesitter-highlights`.
These highlighting groups are linked to default vim highlight groups, see the mapping [here](https://github.com/nvim-treesitter/nvim-treesitter/blob/a74da044a8c208177c0af56eeab709859e2fda38/plugin/nvim-treesitter.vim#L30-L84)

There are multiple colorschemes, that already set these highlight groups and therefore integrate with **TreeSitter**.
[List1](https://github.com/rockerBOO/awesome-neovim#colorscheme)
[List2](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes)
