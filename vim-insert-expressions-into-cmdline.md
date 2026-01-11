---
date: 2026-01-11
tags: [ vim, neovim ]
---

# Vim: insert expressions into Cmdline

If you use `=` in combination with `<C-r>`, you can insert the result of an expression.

Normally, this would just insert/paste the register but `=` is a special register containing the value of an expression.
So, you can do `<C-r> =system('date')` to insert the output of the cli command `date`.
Another example is `<C-r> =6*2`, to insert calculations.
Another example is `<C-r> =expand($HOME)`, to insert environment variable values.




## References
- <https://www.youtube.com/watch?v=7D1k1l-Q8rA>
- `help sub-replace-expression`

