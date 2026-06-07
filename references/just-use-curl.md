---
date: 2026-05-05
tags: [ website, bash, http ]
url: https://justuse.org/curl/
---

# Just use cURL

A set of command examples on how to use `curl` to replace any [http](http) client.

## Examples

`curl -X POST`
`curl -H "Header: value"`
`curl -F file=@file.txt`
Handle cookies? `curl -c cookies.txt -b cookies.txt`
`-c` to save cookies, `-b` to send them.
Follow redirects? `curl -L`
Basic auth? `curl -u user:pass`

## References

<https://justuse.org/curl/>
