---
date: 2026-05-18
tags: [ rust ]
---

# Rust: Common design patterns

These are some design patterns, which are applicable to [Rust](rust-lang).

## Builder pattern

Offer a set of functions to add components to a class, before finishing it with a `.build()` method.

## Factory pattern

## Resource accuisition is initialization

## TypeState

Use types to represent states, i.e. open files are their own class, such that any time you get an OpenFile object, you are guaranteed its open.

## New type

Instead of using magic numbers and comments describing units, wrap them in a struct.

## References

- <https://www.youtube.com/watch?v=1Ql7sQG8snA>
