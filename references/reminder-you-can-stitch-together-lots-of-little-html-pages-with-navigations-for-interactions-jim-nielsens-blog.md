---
date: 2026-05-15
tags: [website, todo, cat3, reference]
url: https://blog.jim-nielsen.com/2026/small-html-pages/
---

# Reminder: You Can Stitch Together Lots of Little HTML Pages With Navigations For Interactions - Jim Nielsen’s Blog

A blog post about using links to navigate between sites and especially establishing a menu page with minimal [Javascript](javascript).

This code snippet creates a link back to the previous page after opening the menu.

```html

<!-- Normal page -->
<nav>
  <a href="/menu/">
      <svg>...</svg>
  </a>
</nav>

<!-- Menu page -->
<nav>
    <a href="/" onclick="document.referrer ? history.back() : window.location.href = '/'; return false;">
        <svg>...</svg>
    </a>
</nav>
```

## References

<https://blog.jim-nielsen.com/2026/small-html-pages/>
