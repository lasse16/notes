---
date: 2025-04-07
categories: [ github github-actions devops ]
---

# Github actions and pinned SHAs

It is generally recommended as a hardening practise to pin third-party Github Actions to SHAs instead of Semantic-versioned tags.
Git tags are mutable and anybody with `write` access can force-push a tag of the same name to a different commit.

At work, we do this to always keep our `v1` tag pointing to the latest `v1` release, whether its actually `v1.0.1` or `v1.9.0`.
So, there is no guarantee that the code at a tag stays the same.
If you are running third-party, public then this is a possible attack vector.
It is the same attack vector, as not validate the new release you are running.

> So, easy. Pin all your versions to a specific commit.

> Ah that's tough to read.

> No problem, I am going to add a comment mentioning the semantic version of a SHA.

> Yes, good and Dependabot even updates that comment. [Github blog post announcing Dependabot updating the version comment](https://github.blog/changelog/2022-10-31-dependabot-now-updates-comments-in-github-actions-workflows-referencing-action-versions/) 

> [!NOTE]
> At $WORK, we have a whitelist for the third-party actions we can use. Setting that up to use only SHAs and people referencing those actions by their SHAs is going to be a PITA.
> But that's for Enterprise DevOps Engineers, not for endusers.

Dependabot is recommended to use to keep vulnerabilities out of your dependencies.
However there are no Dependabot alerts for SHA-versioned actions. <https://docs.github.com/en/code-security/dependabot/dependabot-alerts/about-dependabot-alerts#detection-of-insecure-dependencies>
My guess, it's because SHA -> sem ver is not a clear relation.

## Further notes

### Some actions are unpinnable.
Actions that rely on a Docker image, need to pin the version of that Docker image by SHA as well.
Otherwise, injecting code is possible via a new compromised docker image, while the Git SHA of the Action is still the same.

## References
- [Datadog lint on unpinned actions](https://docs.datadoghq.com/security/code_security/static_analysis/static_analysis_rules/github-actions/unpinned-actions/)
- [Palo Alto post on potentially malicious code through unpinned actions](https://www.paloaltonetworks.co.uk/blog/cloud-security/unpinnable-actions-github-security/)
- [Github Guidelines on using third-party actions](https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions#using-third-party-actions)
- [Github features to use for securing actions](https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions#using-third-party-actions) 
