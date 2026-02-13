---
date: 2025-04-10
tags: [ neovim, git, gpg ]
---

# Signed commits in Neovim

Can not sign commits in Neovim as per default pinentry falls back to pinentry-ncurses, which is blocked by Neovims control of the terminal.
Possible solutions are:

1. Set global pinentry to something that does not use terminal ui.
MacOS has pinentry-mac, which triggers the global password manager on mac.

2. Set pinentry to loopback to just get a single-line terminal prompt.
Then the current terminal UI can handle that single line prompt, including bash and neovim.

3. Write custom script for pinentry, that runs pinentry-ncurses when on bash and something else when in neovim.

## References

- [Cannot sign commits when GPG key requires a password · Issue #846 · tpope/vim-fugitive](https://github.com/tpope/vim-fugitive/issues/846)
- [git - Unable to use Gcommit on Vim when signing commits - Stack Overflow](https://stackoverflow.com/questions/43078230/unable-to-use-gcommit-fugitive-plugin-on-vim-when-signing-commits/43078307#43078307)
- [pinentry-popup](https://github.com/tpope/vim-fugitive/issues/1645)
