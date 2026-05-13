---
date: 2026-05-05
tags: [ git, todo ]
---

# Git: bisect

A built-in [[git]] tool, which iteratively checks out commits to allow [regression testing](regression-testing) on each commit.

## Basics

`git bisect start`
`git bisect bad` to mark a commit as bad.
`git bisect good` to mark a commit as good.
`git bisect reset` to end the session.

## References

- <https://git-scm.com/docs/git-bisect>
