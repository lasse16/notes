---
type: Note
date: 2026-04-28
tags: [ crossplane, kubernetes, todo ]
---

# Crossplane: Best-Practises

Stuff we noticed on what to do better:

- Return resources, even on API failure, otherwise you delete your previous resources
- Limit API calls, resources are reconcilied every 15 seconds.

Anything not in the state at all times will be deleted.
> A function should only add the fields it cares about to the desired state. It should add these fields every time Crossplane calls it. If a function adds a field to the desired state once, but doesn’t add it the next time it’s called, Crossplane deletes the field. The same is true for composed resources. If a function adds a composed resource to the desired state, but doesn’t add it the next time it’s called, Crossplane deletes the composed resource.

A function can change:

    - The status of the composite resource.
    - The metadata and spec of any composed resource.

A function can also change the readiness of the composite resource. A function indicates that the composite resource is ready by telling Crossplane whether its composed resources are ready. When the function pipeline tells Crossplane that all composed resources are ready, Crossplane marks the composite resource as ready.

A function can’t change:

    - The metadata or spec of the composite resource.
    - The status of any composed resource.
    - The connection details of any composed resource.

## References

- <https://docs.crossplane.io/latest/composition/compositions/#how-composition-functions-work>
