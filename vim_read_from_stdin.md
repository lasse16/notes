---
date: 2025-04-10
tags: [neovim]
---

# Vim from standard input

There is a flag for vim which opens text from STDIN.
`vim -` 
That's it. 

Upon closing the file, remember that you do not need to save it. 
Im not sure what happens upon saving the STDIN, without passing an extra file name.
So, `:q!`.
