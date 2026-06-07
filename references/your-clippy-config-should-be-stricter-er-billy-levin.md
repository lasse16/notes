---
date: 2026-05-04
tags: [ website, todo, cat3 ]
url: https://billylevin.dev/posts/clippy-config/
---

# Your Clippy Config Should Be Stricter-er | Billy Levin

A blog post arguing for enabling all lint categories from [[cargo-clippy]].

Here are the example for the section inside the `Cargo.toml` file to enable specific lint categories.

```toml
  [lints.clippy]
  pedantic = { level = "warn", priority = -1 }
  restriction = { level = "warn", priority = -2 }
  # save this one for personal projects maybe :)
  # nursery = { level = "warn", priority = -3 }
```

## References

<https://billylevin.dev/posts/clippy-config/>
