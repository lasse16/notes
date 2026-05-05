---
date: 2026-04-28
tags: [ kubernetes, cat2, cat3 ]
---

# Kubernetes: JSON PATH

Kubectl comes with its own version of `jq`, `-o jsonpath`.
This tool has its own syntax, so it might be easier to use `-o json | jq ...`, but the tool is there.

## Example

### To get a secrets data

```bash
kubectl get secret -n <namespace> <secret-name> -o jsonpath='{.data.<secret-field-name>}' | base64 -d 
```

## References

- <https://kubernetes.io/docs/reference/kubectl/jsonpath/>
