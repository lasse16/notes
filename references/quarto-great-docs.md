---
type: Reference
date: 2026-08-21
tags: [website, python, documentation, quarto, reference]
---

# Hello great-docs

A first look at Posit's `great-docs`, a Quarto-based documentation site generator for Python packages.

`great-docs` is not a generic [[static-site-generator]] like [[jekyll]] or [[references/zola|Zola]].
It is narrowly focused on [[python]] package documentation and uses [[quarto]] as its rendering engine.
The workflow is compact: `great-docs init`, `build`, and `preview` produce a site that includes an auto-generated [[api|API]] reference, [[python-click|Click]] CLI docs, a README landing page, and narrative guides.

What distinguishes it from other documentation tools:

- **No new docstring religion** It accepts existing NumPy, Google, and Sphinx-style docstrings instead of inventing another standard.
- **Quarto-native rendering** It leans on Quarto's multi-format engine (documents, websites, books, notebooks) and extension ecosystem rather than building a separate stack.
- **Posit backing** It comes from the not-for-profit PBC behind Quarto and RStudio, which gives it credibility in data-science workflows.
- **Cross-language on-ramp** It offers R users, who are used to `pkgdown`, a familiar path into Python package docs while nudging Python users toward the broader Quarto ecosystem.

## References

<https://tinashemtapera.com/posts/10_hello-great-docs/hello-great-docs.html>
