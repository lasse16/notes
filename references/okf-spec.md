---
type: Reference
date: 2026-09-02
tags: [ website, reference, note-taking, markdown ]
url: https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md
aliases: ["okf", "OKF"]
---

# Open Knowledge format (OKF) spec

This is the specification of the open knowledge format (OKF).
It is a plain-text format for representing knowledge, which can be read by humans, or agents.

In practise, it is a collection of [[markdown]] files with [[yaml]] frontmatter.

The main part of this format is the frontmatter.
While the frontmatter has a set of required and recommended fields, the body in [[markdown]] is free-text and can contain any information.

Any filenames can be chosen, except for two reserved names, `index.md` and `log.md`.

## frontmatter

### required fields

The only required field of this spec is the `type` field.
It should be a short, descriptive string identifying the concept of the file.

There is no convention or central storage of types, so any name is fine and unknown types should not result in errors.

### recommended fields

These fields are generally recommended in all files:

- `title`
- `description`
- `tags`
- `resource`: this would typically be a link to the remote source of the file, i.e. the URI to a blogpost

There are more fields, which are suitable in niche cases, like the `status` field, which includes `draft, stable, deprecated`, or the `generated` or `verified` fields.

Fields, which require an actor, like `generated` and `verified` generally use a convention to specify the actor.
They take an array of objects with fields for `by` and `at`.

#### Actor convention

This is the convention used by fields recording an identity/actor, like `generated` and `verified`.

There is a prefix categorizing the actor, and an id specifying the actor.

These prefixes are `human:<id>` for a person, for example `human:ahormati`, and `process:<id>` for an automated process, for example `process:finance-nightly`. Agents and tools have no prefix and instead use `<producer>/<version>`, for example `reference_agent/gemini-2.5-pro`. Human-authored or human-confirmed content must use the `human:` prefix.

Here is an example of fully specified `verified` field:

```yaml
verified:
  - { by: human:ahormati, at: 2026-06-25T09:00:00Z }
  - { by: process:finance-nightly, at: 2026-06-26T02:00:00Z }

```

### provenance: `sources`

The `sources` field records the materials a file was derived from, external or internal to the bundle.
Each entry has a `resource` (a URL, a bundle-relative path, or a scope description), and optionally an `id` (a stable key for attributing individual claims via markdown footnotes), a `title`, and credibility signals: `author`, `usage_count`, and `last_modified`.
A `usage_window` sibling field frames what time range `usage_count` covers.

OKF deliberately records these objective signals instead of a subjective trust score, since a score doesn't port across consumers and goes stale.

```yaml
sources:
  - id: ga4-schema
    resource: https://developers.google.com/analytics/bigquery/export-schema
    title: GA4 BigQuery Export schema
    author: team:ga4-docs
    usage_count: 5000
    last_modified: 2026-05-30T00:00:00Z
usage_window: { from: 2026-06-01T00:00:00Z, to: 2026-06-30T00:00:00Z }
```

### trust tiers

Consumers derive a trust tier from the `verified` field:

- no `verified` key → unverified
- `verified` by non-`human:` actors only → machine-confirmed
- `verified` by a `human:<id>` actor → human-reviewed

A file without any trust fields is still valid and must not be rejected; trust tiers are advisory, not access control.

### lifecycle

Besides `status` (`draft`, `stable`, `deprecated`, defaulting to `stable`), there is `stale_after`, an absolute ISO 8601 datetime after which the content is considered stale.
It's an absolute instant rather than a relative TTL, so staleness is a plain comparison against "now".

```yaml
status: stable        # draft | stable | deprecated
stale_after: 2026-09-23T00:00:00Z   # content is stale on/after this instant
```

## bundle structure

A collection of these files is called a bundle.
Each file is a "concept".
Concepts can be nested in subdirectories freely; only `index.md` and `log.md` are reserved.

Concepts can link to each other with normal markdown links, either bundle-root-relative (starting with `/`, the recommended form since it survives the file being moved within its directory) or relative.
A link merely asserts *some* relationship; the kind of relationship is left to the surrounding prose.
Broken links are tolerated, since they may just point to not-yet-written knowledge.

A `references/` subdirectory is a naming convention (not a requirement) for mirroring external material, run instructions, or code as concepts, e.g. `references/attesters/revenue.py`.

### index and log files

`index.md` may exist at any directory level to list its contents for progressive disclosure, grouped under headings with a bullet list of links and short descriptions.
It normally carries no frontmatter, except a bundle-root `index.md` may declare `okf_version`.

```markdown
# Section / Group Heading

* [Title 1](relative-url-1) - short description of item 1
* [Title 2](relative-url-2) - short description of item 2

# Another Section

* [Subdirectory](subdir/) - short description of the subdirectory
```

`log.md` may exist at any directory level to record a chronological history of changes, as a flat list of entries grouped under `## YYYY-MM-DD` headings, newest first.

```markdown
# Directory Update Log

## 2026-05-22
* **Update**: Added a BigQuery table reference for [Customer Metrics](/tables/customer-metrics.md).
* **Creation**: Established the [Dataplex Playbook](/playbooks/dataplex.md).

## 2026-05-15
* **Initialization**: Created foundational directory structure.
```

## body conventions

The body is free-text [[markdown]], but a few headings have conventional meaning when applicable: `# Schema` for structured fields/columns of an asset, and `# Examples` for usage examples.

## conformance

A bundle conforms to OKF if every non-reserved `.md` file has parseable YAML frontmatter with a non-empty `type`, and `index.md`/`log.md` follow their conventions where present. Consumers must not reject a bundle over missing optional fields, unknown `type` values, unknown extra keys, broken links, or missing `index.md` files.

## References

<https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md>
