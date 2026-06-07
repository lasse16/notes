---
date: 2026-05-05
tags: [website, python, reference]
url: https://rdrn.me/postmodern-python/
---

# Beyond Hypermodern: Python is easy now - Chris Arderne

This blog post is a collection of modern tooling for [Python](python).

These tools are:

- [uv](uv) for project and dependency management
- [ruff](ruff) for linting
- [pyright](pyright) for type hinting
- [pytest](pytest) for testing
- [poe the poet](poe-the-poet) for task running

Across all these tools, the `pyproject.toml` configuration file is the default location for any customization.

In general, the post also recommends to set up as many type hints and docstrings as possible, since autocompletion depends on it.

## [UV](uv) details

Use this section to make the package runnable without calling it via `python -m <package>`

```toml

# add these to your pyproject.toml
[uv.tool]
# tell uv we're building a package
# (i.e. something we can distribute for others to use)
package = true

[project.scripts]
# running `<package>` will run the `<package>.main` function
<package> = "<package>.main:main"

```

## [Ruff](ruff) details

```toml
[tool.ruff]
# if this is a library, enter the _minimum_ version you
# want to support, otherwise do py313
target-version = "py313"
line-length = 120  # use whatever number makes you happy

[tool.ruff.lint]
# you can see the looong list of rules here:
# https://docs.astral.sh/ruff/rules/
# here's a couple to start with
select = [
    "A",    # warn about shadowing built-ins
    "E",    # style stuff, whitespaces
    "F",    # important pyflakes lints
    "I",    # import sorting
    "N",    # naming
    "T100", # breakpoints (probably don't want these in prod!)
]
# if you're feeling confident you can do:
# select = ["ALL"]
# and then manually ignore annoying ones:
# ignore = [...]
```

## References

<https://rdrn.me/postmodern-python/>
