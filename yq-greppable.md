---
date: 2026-02-16
tags: [cli, yaml, yq]
---

# YQ: improved grepping

There are various tools to help with making JSON and YAML easier to look through.
There is `gron`, which outputs full field names and can reverse it back into a proper JSON structure.
However, plain vanilla `yq` can do something similar as well.

With `-output-format=props` or `-o props`, you can get the fields greppable as key-value pairs, e.g.

```yaml
# test.yml
tutorial:
  - yaml:
      name: "YAML Ain't Markup Language"
      type: awesome
      born: 2001
  - html:
      name: "HTML Ain't programming"
      type: awesome
      born: 1995
```

```bash
$ yq eval -o props test.yml

tutorial.0.yaml.name = YAML Ain't Markup Language
tutorial.0.yaml.type = awesome
tutorial.0.yaml.born = 2001
tutorial.1.html.name = HTML Ain't programming
tutorial.1.html.type = awesome
tutorial.1.html.born = 1995
```

## References

- <https://github.com/mikefarah/yq/discussions/931>
- <https://github.com/tomnomnom/gron>
