---
type: Note
date: 2026-03-04
tags: [ github, todo ]
---

# Custom [Github Actions](github-actions)

There are multiple ways to write your own Github Actions.

1. JavaScript actions
2. Composite actions
3. Docker actions

All actions must have an accessible repository with an `action.yml` file, describing its properties.

The syntax and fields are on this github site about the [metadata syntax][action-yml].

Deciding on the approach to use, is easy depending on which languages you know.
Javascript actions do not need docker accessible on the runner and as such have a quicker startup time, but are dependant on the runners environment.

## JavaScript actions

## composite actions

This is just a way to wrap and combine multiple steps into a single actions step.

## Docker actions

> [!IMPORTANT]
> The runner for the workflow using the action must have Docker installed
> This is not the case for the Github-hosted slim runners.

You can choose any base Docker image and, therefore, any language for your action.

### Specific metadata

`runs.using` must be `'docker'`

#### [`runs.image`](https://docs.github.com/en/actions/reference/workflows-and-actions/metadata-syntax#runsimage)

This can be a local `Dockerfile`, a public image at DockerHub or an image in a public registry.

##### Local `Dockerfile`

The file must be name `Dockerfile` and the path must be relative to the `action.yml` file.
[Various restrictions][dockerfile-actions] on what is allowed in the `Dockerfile`

##### Public image

Can we use the GHCR? Because our registry is not publically accessible.
I doubt that it is true, but I can hope.

<!-- TODO: confirm with Malte -->
<!-- https://stackoverflow.com/questions/60675844/create-a-fast-running-docker-custom-action -->
from my research, it is only possible to use public registries.
even more testing, has confirmed this.
Pushing the package to the GHCR.io, it is not accessible for runners.
I have set the package visibility to internal, and tested from a repository inside the same enterprise.
All approaches failed with "unauthorized" from the Docker daemon.

### Interacting with Github

- Files can be accessed at `$GITHUB_WORKSPACE`, which per default is mounted to `/github/workspace`.

- Interact with the outside to Github via [workflow commands][workflow-commands]
[workflow-commands]: <https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-commands#about-workflow-commands>

- [Github Packages](https://docs.github.com/en/packages/learn-github-packages/introduction-to-github-packages) have the advantage that by specifying the `packages:read` permission, authentication for private Actions is handled.
It has a Container registry available <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>.

## References

- [action-yml]
- [oneuptime]

[oneuptime]: <https://oneuptime.com/blog/post/2026-01-30-github-actions-container-actions/view>
[action-yml]: <https://docs.github.com/en/actions/reference/workflows-and-actions/metadata-syntax>
[dockerfile-actions]: <https://docs.github.com/en/actions/reference/workflows-and-actions/dockerfile-support>
