# Agent Instructions

This repository is a personal knowledge base managed with [zk](https://github.com/zk-org/zk). It follows the OpenKnowledge format: every note is a Markdown file with a YAML frontmatter block followed by a Markdown body.

## Format

- All notes must start with YAML frontmatter (`---` delimited).
- `type` is required in the frontmatter. Only use existing note types (`Note`, `Reference`, `GlossaryEntry`, `Website`, etc.); do not invent new types.
- Other common frontmatter keys are `date` and `tags`.
- The note body uses Markdown with `[[wikilink]]` syntax for internal links.
- Use the templates in `.zk/templates/` as the format contract for each note type.

## Tooling

The `justfile` at the repository root defines aliases and shortcuts for common zk operations. Agents and skills should reuse those commands instead of re-implementing the underlying zk invocations.

## Structure

- Top-level `.md` files are the main notes. They contain and compose information sourced from the `references/` directory.
- `references/` — source-reference collection for external links and resources.
- `glossary/` — glossary entries.
- `.zk/templates/` — note templates (e.g., `reference.md`, `glossary.md`, `website.md`).
- `.agents/skills/` — specialized skills for this repository.
