---
type: Note
date: 2026-09-02
tags: [ note-taking, todo, okf, zk ]
---

# OKF / zk frontmatter and layout: open decisions

Follow-up decisions from comparing [[references/okf-spec]], [[references/llm-wiki-github]], and the actual [[zk]] setup (`.zk/templates/`, `.zk/config.toml`, `justfile`) used in this repo.

1. **Unify the "source URL" field name.** Three different keys are currently used for "link to external source": OKF recommends `resource`; `.zk/templates/website.md` uses `url` (via `{{extra.url}}`); `note-taking-building-a-public-garden.md` uses an ad-hoc `website:` key. Pick one and update the template, `AGENTS.md`, and existing notes.

2. **Adopt or explicitly reject OKF's provenance/trust fields** (`sources`, `verified`, `generated`, actor convention). None of the four templates emit these today. Either add them where useful or state in `AGENTS.md` that this layer is out of scope.

3. **Adopt or reject OKF's lifecycle fields** (`status`, `stale_after`) vs. the current `todo` tag convention. The tag is a weaker binary flag with no expiry — decide if that's sufficient or if richer staleness tracking is worth it.

4. **Document the closed `type` enum as a local extension.** OKF keeps `type` unconstrained; `AGENTS.md` restricts it to `Note`/`Reference`/`GlossaryEntry`/`Website`. Worth stating explicitly so future contributors/agents don't invent new types.

5. **Confirm the `index.md`/`log.md` deviation is fully intentional.** `index.md` → `notebook.db` is already documented; `log.md` (chronological change log) isn't addressed at all. Decide whether to adopt it or explicitly skip it.

6. **Consider a conformance/completeness check in `just housekeeping`.** It currently checks tags, dead links, and unlinked mentions, but nothing validates OKF conformance (non-empty `type`) or flags missing recommended fields.

7. **Decide on frontmatter `title` vs. H1-only.** zk supports a frontmatter `title` (which takes precedence over the H1), but the templates only set the title in the body heading.

8. **Audit the ~150 existing notes for drift.** Only templates and two sample notes were checked during research; there may be more ad-hoc/inconsistent fields (like the `website:` key found) across the full corpus.

## References

- [[references/okf-spec]]
- [[references/llm-wiki-github]]
- [[note-taking-building-a-public-garden]]
