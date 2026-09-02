---
type: Reference
date: 2026-08-19
tags: [ website, reference, note-taking ]
url: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
---

# llm-wiki · GitHub

A gist about a wiki maintained and updated using an LLM.
The main idea behind it is, that the actual linking and writing text is done by the LLM, as well as updating any cross-references.
This tedious *book-keeping* is done by the LLM, while the actual source selection as well as working out contradictions, highlights and summaries are done by the human, or at least with human guidance.

The LLM supports with the *book-keeping*, which also works as the occasional linting, but can also advise and write down when ingesting a new source.
Ingesting a new source is the event at which all updating of other wiki pages should happen, so having the LLMs support during highlighting the important parts of the new source should help when keeping links fresh.

The LLM basically has three skills, *ingest*, *query*, *lint*.

Ingesting gets a source and compiles its main points into raw sources, which can be used for any future reasoning.

This future reasoning is the *query* skill.
It answers questions with reasoning based on the information from ingested sources.
Any information gained by querying, can be stored in general notes, and used to update the information from the sources.

The last skill of *linting* is the general book-keeping and reference-maintaining needed for the existence of a wiki.
The stuff that usually makes you fail a wiki, because the administrative effort gets too large.

## References

<https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f>
