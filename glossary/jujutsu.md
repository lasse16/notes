---
date: 2026-06-08
tags: [ glossary, jujutsu, version-control-system ]
aliases: ["Jujutsu"]
---

# Jujutsu

A [[vcs]] building on-top of [[git]] with a simpler mental model.

## Features

- stacked-diff workflows
- seamless rebases
- ephemeral revisions
- deferred conflict resolving

## How it works

`jj git init --colocate` to create a `.jj` directory alongside the `.git` directory.

> [!NOTE]
> Careful with `git clean`, to not delete the `.jj` directory

A set of changes are called `revisions` and can be created with `jj new <ref>`, i.e. `jj new main`.
These revisions are the closest unit to a traditional git commit.

Any changes are automatically included in the new revision, i.e. there is no `git add`.

`jj new` creates a new `revision`, while `jj describe` adds a commit message.
This is split into two, but there is `jj commit`, which combines them into one step again.

Editing a revision is done with `jj edit <sha>`, vs. `git checkout <sha>`.
Relative commit selecting is possible with `x+` to get children and `x-` to get parents vs. `x~`

It is also possible to select all children with `x::`, is there such a thing in git ?

`Bookmarks` are the closest thing to branches, but are closer to tags.
They must be manually pushed to the latest revision on what would be a traditional branch.

`jj` has the ability to mark revisions as conflicted in the follow-up of a merge, allowing you to edit it later or in a new commit.

See the [second blog entry by madeleine mortensen for usage examples](https://maddie.wtf/posts/2025-07-21-jujutsu-for-busy-devs/entry/1).

## References

- [[references/jujutsu-for-busy-devs-maddie-wtf]]
- <https://maddie.wtf/posts/2025-07-21-jujutsu-for-busy-devs/entry/1>
- <https://steveklabnik.github.io/jujutsu-tutorial/>
- <https://docs.jj-vcs.dev/latest/>
