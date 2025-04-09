Recently I went through the trouble of installing `tree-sitter`.
During that process, I used `sudo make install` only to uninstall it again later.
But uninstalling wasn't as easy as running `sudo make uninstall`.
That command does work if and only if the authors provide an UNINSTALL file.
That was not the case, so I had to go in and manually delete the installed files and symlinks.
If this happens again, run `make install -n` to see the steps taken by the Makefile an revert them manually.
Two commands were used in this specific Makefile, which were previously unknown to me.
First, `cc` as a replacement for `gcc`.
It just compiles a `*.c` into a specified output file.
Second, the `install` command.
I first thought it might make something special but judging from the man-entry, it just copies the files to a new location.
To revert it, delete the files from their new location.
Run `make clean` to delete left-over original files and compile artifacts.

Avoid this problem completely in the future by installing all packages via `checkinstall`.
This package creates a `*.deb` file from a Makefile, which can then be installed via a package manager like `apt`.
This results in the package listed in the registry and also an uninstall-process supervised by the package manager instead of me.



REFERENCES:
[StackOverflow Post](https://stackoverflow.com/questions/1439950/whats-the-opposite-of-make-install-i-e-how-do-you-uninstall-a-library-in-li)
[Wiki-Entry checkinstall](https://wiki.ubuntuusers.de/checkinstall/)
