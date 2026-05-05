---
date: 2026-04-28
tags: [ crossplane, kubernetes, todo ]
---

# Crossplane: Best-Practises

Stuff we noticed on what to do better:

- Return resources, even on API failure, otherwise you delete your previous resources
- Limit API calls, resources are reconcilied every 15 seconds.

## References
