---
type: Note
date: 2026-09-02
tags: [ note-taking, okf, zk, reference ]
---

# OKF spec vs. llm-wiki vs. zk

A comparison of the three things that together define how this notebook is structured: [[references/okf-spec|OKF]] (the frontmatter/bundle format spec), [[references/llm-wiki-github|llm-wiki]] (the ingest/query/lint workflow philosophy), and [zk](https://github.com/zk-org/zk) (the actual CLI tool enforcing indexing and templating), as adopted and synthesized in `AGENTS.md`.

They operate at different levels and are complementary, not competing: OKF is a **format spec** (fields, file naming, bundle layout, conformance rules); llm-wiki is a **workflow philosophy** (three LLM skills: ingest, query, lint; humans curate, LLMs do book-keeping) with no opinion on field names or layout; zk is the **executable layer** underneath both — it actually parses and indexes a smaller, different set of frontmatter keys, and drives note creation via Handlebars templates and per-directory config groups. `AGENTS.md` adopts OKF's `type`-required convention and llm-wiki's three-skill process, implemented in practice through zk's templates/config/justfile — while explicitly overriding OKF's `index.md` convention because zk's `notebook.db` makes it redundant.

## What OKF specifies

- **Required**: only `type` (any string; unknown types must not error).
- **Recommended**: `title`, `description`, `tags`, `resource`; niche fields `status` (draft/stable/deprecated), `generated`, `verified`, `stale_after`, `sources`.
- **Actor convention** for `generated`/`verified`: `human:<id>`, `process:<id>`, or bare `<producer>/<version>` for agents.
- **Provenance** (`sources`): array of `{resource, id?, title?, author?, usage_count?, last_modified?}` plus a sibling `usage_window`; deliberately objective signals rather than a subjective trust score.
- **Trust tiers** (derived, not stored): unverified / machine-confirmed / human-reviewed, from `verified`'s actor prefixes.
- **Bundle structure**: arbitrary nesting; only `index.md` and `log.md` reserved; `references/` is an optional naming convention, not a requirement.
- **Conformance**: parseable frontmatter + non-empty `type`; must tolerate missing optional fields, unknown types/keys, broken links, missing `index.md`.

OKF says nothing about a references/wiki/glossary split, LLM roles, or `GlossaryEntry` — those are local extensions.

## What llm-wiki specifies

A process model, not a format: the LLM does linking/cross-referencing/book-keeping; the human does source selection, contradiction-resolution, highlighting. Three skills — **ingest** (compile a new source into raw material), **query** (answer questions from ingested sources, optionally promoting findings into general notes), **lint** (ongoing reference maintenance). No frontmatter fields, file rules, or directory layout are specified at all.

## What zk specifies (and how this repo uses it)

zk has an *executable* notion of frontmatter — keys it actually indexes into `notebook.db`:

- **Native keys**: `title` (overrides H1), `date`/`modified` (override file mtime; key names configurable), `tags`/`keywords`, `aliases` (used by `--mention`). All queryable via `{{metadata.<key>}}`.
- **Tags**: YAML `tags`/`keywords` plus `#hashtags`, `:colon:tags:`, and Bear-style multi-word tags — filterable with boolean expressions (`--tag "todo, NOT done"`).
- **Link format**: configurable `markdown` or `wiki`; this repo sets `link-format = "wiki"` in `.zk/config.toml`, matching `AGENTS.md`'s mandated `[[wikilink]]` syntax.
- **`[note]` config**: `template`, `filename` pattern, `id-charset`/`id-length`/`id-case`, `exclude`. This repo only sets `template = "default.md"` and relies on title-slug filenames rather than zk's ID-based schemes.
- **Templates**: Handlebars, with a creation context of `id`, `title`, `content`, `dir`, `extra.<key>`, `now`, `env`, and helpers like `{{format-date}}`, `{{slug}}`, `{{sh}}`.
- **Groups**: `.zk/config.toml` defines `[group.references]` (`references/*`) and `[group.glossary]` (`glossary/*`) — the actual mechanism enforcing the references/glossary split that `AGENTS.md` describes in prose.

### This repo's four templates

| Template       | `type`          | zk-native fields                                     | OKF fields present | OKF fields missing                                                                                                    |
| -------------- | --------------- | ---------------------------------------------------- | ------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `default.md`   | `Note`          | `date`, `tags` (placeholder)                         | `tags`             | `description`, `resource`, `sources`, `status`, `verified`/`generated`, `stale_after`                                 |
| `reference.md` | `Reference`     | `date`, `tags`                                       | `tags`             | same                                                                                                                  |
| `website.md`   | `Reference`     | `date`, `tags`, non-OKF `url` (from `{{extra.url}}`) | `tags`             | `description`, `sources`, `status`, `verified`/`generated`, `stale_after`; and uses `url` instead of OKF's `resource` |
| `glossary.md`  | `GlossaryEntry` | `date`, `tags`, `aliases`                            | `tags`             | same as default                                                                                                       |

None of the four templates emit OKF's provenance/trust/lifecycle fields — that layer of OKF is currently aspirational, not implemented.

The `justfile` is the automation glue: `new-ref`/`new-glossary` bind templates to target directories; `new-site` scrapes a page `<title>` and populates `website.md`'s `url` via `--extra`; `ai-ingest` delegates the *ingest* skill to a Copilot CLI skill; `housekeeping` operationalizes *lint* via `zk list --tagless`, `zk dead-links`, `zk unlinked-mentions`, and `zk list --tag todo`.

[[note-taking-building-a-public-garden]] documents the human-driven tool choice (zk + Neovim over a rendered wiki like Quartz) that neither OKF nor llm-wiki addresses — and itself uses a third variant field name, `website:`, for the same "external source link" concept as OKF's `resource` and the website template's `url`.

## Comparison table

| Aspect                    | OKF                                                               | llm-wiki                              | zk                                                        | This repo                                                                                 |
| ------------------------- | ----------------------------------------------------------------- | ------------------------------------- | --------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| Required field            | `type` (any string)                                               | —                                     | none required                                             | `type` restricted to `Note`/`Reference`/`GlossaryEntry`/`Website`                         |
| Native/recommended fields | `title`, `description`, `tags`, `resource`                        | —                                     | `title`, `date`, `modified`, `tags`/`keywords`, `aliases` | Templates emit `type`, `date`, `tags` (+`aliases`/`url` in two templates)                 |
| Provenance/trust          | `sources`, `verified`, `generated`, actor convention, trust tiers | implicit (human judgment only)        | not modeled                                               | not adopted anywhere                                                                      |
| Lifecycle                 | `status`, `stale_after`                                           | —                                     | not modeled (closest: `todo` tag)                         | plain `todo` tag substitutes for `status`/`stale_after`                                   |
| Reserved filenames        | `index.md`, `log.md`                                              | —                                     | none; `notebook.db` is the index                          | `index.md` explicitly replaced by `notebook.db`; `log.md` unaddressed                     |
| Directory layout          | free-form; `references/` optional                                 | —                                     | meaningful only via `[group.*]` globs                     | references/ + top-level + glossary/, enforced via `[group.references]`/`[group.glossary]` |
| Templating                | not addressed                                                     | not addressed                         | Handlebars, `[note] template`/`filename`                  | 4 templates map 1:1 to the 4 `type` values                                                |
| Link syntax               | relative or root-relative Markdown links                          | not addressed                         | configurable `markdown`/`wiki`                            | `link-format = "wiki"`, matching `[[wikilink]]`                                           |
| Roles/process             | not addressed                                                     | ingest/query/lint, human+LLM division | not addressed                                             | adopts ingest/query/lint as `AGENTS.md` workflows, wired to `justfile`                    |
| Conformance               | explicit, degrade-gracefully rules                                | not addressed                         | none; tolerates anything                                  | no automated OKF-conformance check yet                                                    |

## Open naming inconsistency

Three different keys are used across this repo for "link to the external source": OKF's `resource`, `website.md`'s `url`, and `note-taking-building-a-public-garden.md`'s ad-hoc `website:`. Not yet unified — tracked in [[okf-zk-frontmatter-decisions]].

## Caveats

Only the four templates, `justfile`, `.zk/config.toml`, `AGENTS.md`, and two sample notes were inspected directly; the full ~150-note corpus was not audited for frontmatter drift. zk citations reference the tool's documentation source files in [zk-org/zk](https://github.com/zk-org/zk) (commit `e8bf4b3e2b611d10c611a9634cdc94a83df72a95`) rather than the rendered docs site, which returned 404s for several guessed URLs during research.

## References

- [[references/okf-spec]]
- [[references/llm-wiki-github]]
- [[note-taking-building-a-public-garden]]
- [[okf-zk-frontmatter-decisions]]
- <https://github.com/zk-org/zk>
