---
date: 2026-05-30
tags: [ todo,object-oriented-programming, glossary ]
---

# Composition over inheritance

This is a design guideline for [[object-oriented-programming]].

Implementing it, means that an object should defer methods to actual implementing derived types.

An example, a car should defer interaction to the door object with its own interact method, instead of implementing an interact method, which calls the door object.
The car should still implement the interactable interface though, and defer the interact method to the door.

Common sentence to explain this is "It's better to compose what an object can do via a 'has-a' than a 'what-is'".

## References

- <https://en.wikipedia.org/wiki/Composition_over_inheritance>
