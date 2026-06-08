---
date: 2026-06-08
tags: [ website, reference, todo, cat3 ]
url: https://sumnerevans.com/posts/software-engineering/stop-using-conventional-commits/
---

# Stop Using Conventional Commits - Sumner Evans

A blog post critizing the conventional commit message format ala `type(scope): message`.

The critique targets the `scope`, since it is optional, and the author believes this to be the important factor.
The scope indicates which commits changed something you might be working on as well.

It has a good write-up on [formats other projects use](https://sumnerevans.com/posts/software-engineering/stop-using-conventional-commits/#a-better-way).

## Verdict

I dont agree with the author.
Yes, the convention is not perfect, escpecially since everybody might have a slight different understanding of `refactor` vs `fix`, but I rarely use the type without inspecting it for a release.

I would prefer if the scope would not be optional, but it is better than the wild-west we had before.

## References

<https://sumnerevans.com/posts/software-engineering/stop-using-conventional-commits/>
