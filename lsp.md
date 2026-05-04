---
date: 2026-05-05
tags: [ lsp ]
aliases: ["language server", "language server protocol", "LSP", "lsp"]
---

# LSP: Language server protocol

A protocol to which language tooling can adhere, such that editors only need a single client implementation to receive language-specific hints and completions.

This protocol is based on JSON-RPC communication between a client (EDITOR) and a language-specific server.

It was originally thought up by Microsoft for integration with VSCode, but has since become the standard for modern development tools.

Neovim has its own client implementation, and a list of known good servers with a built-in configuration in [neovims lsp servers][neovim-lsp]

## References

- [Official microsoft docs](https://microsoft.github.io/language-server-protocol/)
- [neovim-lsp]

[neovim-lsp]: <https://github.com/neovim/nvim-lspconfig>
