---
type: Note
date: 2026-09-02
tags: [ markdown, neovim, writing ]
---

# Semantic line breaks (one sentence per line)

A convention for writing prose in [[markdown]] (or other markup with insensitive vertical whitespace) where a line break is inserted after every sentence, and optionally after independent clauses.
Since a single line break renders as a space, the rendered output is unaffected, but diffs stay scoped to the sentence that actually changed.
This is specified by [SemBr][sembr-spec].

My current [[markdown]] formatter, [[rumdl]], does not support any rule for formatting based on semantic line breaks.
it is a structural linter/formatter (headings, lists, links, tables, etc.) with 82 rules, but has no rule or plugin API for sentence-aware line wrapping.

Two tools actually implement it:

- [mdslw][mdslw], the MarkDown Sentence Line Wrapper. Written in Rust, purely rule-based (end-of-sentence punctuation `.!?:` plus an abbreviation word list), no ML dependency. Protects link text by turning its spaces into non-breaking spaces before wrapping, so it never breaks mid-link. Ships a built-in formatter in [[conform-nvim]].
- [sembr][sembr-tool], a transformer-model-based tool (Python/PyTorch, optional MLX/CUDA backends). More accurate at sentence detection in ambiguous prose, but heavyweight (model download, GPU-friendly). Has no built-in [[conform-nvim]] formatter; would need to be wired up manually as a stdin/stdout formatter.

For my [[nix|NixOS]] + [[conform-nvim]] setup, `mdslw` is the simpler fit: it's a single static binary (packageable via nix) and requires no custom conform formatter definition since one already ships upstream.

Older alternative: [[vim-pencil]] + `vim-textobj-sentence`, a Vim plugin doing sentence-aware `gq` reflow. More heavyweight than needed if only sentence-per-line formatting on save is required.

## References

- [sembr-spec]
- [mdslw]
- [sembr-tool]
- <https://rumdl.dev>
- <https://github.com/rvben/rumdl>

[sembr-spec]: <https://sembr.org>
[mdslw]: <https://github.com/razziel89/mdslw>
[sembr-tool]: <https://pypi.org/project/sembr/>
