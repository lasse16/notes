---
date: 2026-03-12
tags: [ python, github, todo ]
---

# Python: Writing custom Github Actions

General stuff for custom Container Actions still applies.
See [[rust-writing-github-actions]] for details.

- only possible as container action ( Python is pre-installed on the runners, so a stand-alone script can also be an option)

- probably best with a typed API client, like [PyGithub][pygithub].

- there is no official helper for interacting with the Actions syntax, like getting inputs, setting outputs, logging at certain levels.
    There are, however, multiple smaller community projects, that accomplish this, but none has an appropiate star count or committer base.
    Some of these community projects are: <https://github.com/VatsalJagani/github-action-toolkit-python> (vibe-coded by single person)

- it is possible to interact by simply parsing the environment variables.
    $GITHUB_OUTPUT is a file location.
    $INPUT_** is the pattern created for each actions input.
    Files are accessible on the Container Action after checkout at `/github/workspace` or whereever `$GITHUB_WORKSPACE` points to.

- input parsing utils should include some conversion.
This can be done by making them generic with `@overload` and the [typing python module][python-typing].
Use `Type`,`Any`,`TypeVar` and more.

## CI/CD

Actions can be used as a pre-built container or from the Dockerfile.

But for both ways, there is still the option to setup the typical CI pipelines with testing, linting etc. in python
See the github starters and [docs for common examples][python-ci-examples].

## References

[Official PyGithub docs][pygithub]
[Official typing docs][python-typing]

[pygithub]: <https://github.com/PyGithub/PyGithub>
[python-typing]: <https://docs.python.org/3.14/library/typing.html>
[python-ci-examples]: <https://docs.github.com/en/actions/tutorials/build-and-test-code/python>
