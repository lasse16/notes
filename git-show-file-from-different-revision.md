---
tags: [ git ]
date: 2024-06-18
---

# Show file in different revision

It is possible to show a file at a different revision/commit with `git show <REV>:<file>`.

You can use this to see a file in your editor without having to change your local repository.
Check your changes against a git revision, copy stuff from an old commit, view different versions of the same file, etc.


In combination with `git log`, you can view all revisions of a file, e.g.
`FILE=test.txt && git log $FILE | fzf | cut -f1 -d" " | xargs -I{} git show {}:$FILE`
