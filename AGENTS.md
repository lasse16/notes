# Agent Instructions

This repository is a personal knowledge base managed with [zk](https://github.com/zk-org/zk).
It follows the OpenKnowledge format: every note is a Markdown file with a YAML frontmatter block followed by a Markdown body.

## Format

- All notes must start with YAML frontmatter (`---` delimited).
- `type` is required in the frontmatter. Only use existing note types (`Note`, `Reference`, `GlossaryEntry`, `Website`, etc.); do not invent new types.
- Other common frontmatter keys are `date` and `tags`.
- The note body uses Markdown with `[[wikilink]]` syntax for internal links.
- Use the templates in `.zk/templates/` as the format contract for each note type.

## Tooling

The `justfile` at the repository root defines aliases and shortcuts for common zk operations.
Agents and skills should reuse those commands instead of re-implementing the underlying zk invocations.

## Structure

This repository follows the three-layer architecture described in [[references/llm-wiki-github]]:

1. **Raw sources** → `references/` — structured notes about external sources (articles, gists, websites). The LLM may write summaries here when ingesting, but these are treated as the source-of-truth layer and are not revised to reflect later synthesis.
2. **The wiki** → top-level `.md` files — synthesis notes that compose and cross-reference content from `references/`. This is the primary LLM-maintained layer.
3. **The schema** → `AGENTS.md` (this file) — conventions and workflows for the LLM.

Additional directories:

- `glossary/` — `GlossaryEntry` notes; equivalent to entity/concept pages in the wiki layer.
- `.zk/templates/` — note templates (e.g., `reference.md`, `glossary.md`, `website.md`).
- `.agents/skills/` — specialized skills for this repository.

Navigation is handled by `zk` and its `notebook.db` index (replaces a manual `index.md`).

## Workflows

### Ingest

When a new source arrives, create a `Reference` or `Website` note in `references/`, then update any relevant top-level wiki notes with new cross-references or revised synthesis.
Use `[[wikilink]]` to link between notes.

### Query

Search with `zk` (see `justfile` for shortcuts), read relevant wiki pages, and synthesize an answer.
If the answer is reusable, file it as a new top-level note.

### Lint

Periodically check for orphan pages, missing cross-references, stale claims, and concepts that deserve their own note.
