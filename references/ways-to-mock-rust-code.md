---
date: 2026-05-15
tags: [ website, rust, testing ]
url: https://blog.appliedcomputing.io/p/all-the-ways-to-mock-your-rust-code
---

# All the ways to mock your Rust code

A blog post about how to mock an [http](http) client for testing [Rust](rust-lang) code.

There are multiple methods presented, all with trade-offs.

Method 1 is a boxed trait, which is [dependency injected](dependency-injection) into the calling function.
This is the method I used in all [object-oriented programming languages](object-oriented-programming) I used so far.
In Rust however, this is somewhat of an anti-pattern, as it relies on dynamic dispatch.

Method 2 is to make the injected object generic over its sending type.
This way, Rust creates a static dispatch at compile-time, which does not incur performance overhead at run-time.

There are other methods mentioned, but these all involve spinning up some remote server to test with.

## References

<https://blog.appliedcomputing.io/p/all-the-ways-to-mock-your-rust-code>
