---
date: 2025-06-10
tags: [ kubernetes ]
---

# pod security standards (PSS)

> [!NOTE]
> Helm does support autocompletion via json schema if `values.schema.json` is present in chart directory.

## Alpine Linux

This runs with apk and as root per default.
It is necessary to define the image on top of Alpine first and then reuse that image.

## https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-blackbox-exporter

Is already configured correctly, only needs a seccompProfile

## ca-certificate installs 

This is not possible without root/sudo.
`curl`  can use certificates on per command level with flags `--cacert`

## ReadOnly Root file system
`/tmp`  is not writeable by default.
I avoided writing a file to disk, can also mount emptyDir as `/tmp` 
<https://www.thorsten-hans.com/read-only-filesystems-in-docker-and-kubernetes/> 

## velero
upgrade-crds job?

podSecurityContext
containerSecurityContext
<https://github.com/vmware-tanzu/helm-charts/blob/main/charts/velero/values.yaml> 

`USER cnb:cnb`  <https://github.com/vmware-tanzu/velero/blob/232bc907962cc32bde07dfb6c2a4977d6f47f090/Dockerfile> 

Must specify for `DaemonSet NodeAgent` as well.
With `nodeAgent.containerSecurityContext`
NodeAgents need writeable `/tmp` directory -> use `nodeAgent.extraVolumes` and `nodeAgent.extraVolumeMounts`

## quay.io/prometheuscommunity/json-exporter 

This container runs as `user: nobody`.
So, PSS can not confirm that this user is non-root.

![User nobody run](../../../../../mnt/c/Users/lasse/Pictures/Screenshots/Screenshot%202024-07-09%20174835.png)

Quick fix:
RunAsUser with numeric id of `user: nobody` which in most OSs is 65534.

### user nobody
Originally used for Network file system servers.
Ubuntu advises against using this ever.

Part of the optional users defined by the linux refspec.

Ongoing controversy between using this user for untrusted processes since this user has no rights.
This is frequently repeated around the net in various articles.

But there is also the Ubuntu wiki, that mentions this user as being for network file transfers and only that.
It is assigned as an owner to files that nobody should have access to.
Only root if it becomes nobody.

I lean towards the second explanation, but still it is used in the first way a lot.
I even stumbled upon this topic because a docker container is running as `nobody` and the pod security standards dont like it.

## Ignoring templating in Fleet


## References
- <https://wiki.ubuntu.com/nobody>
- <https://refspecs.linuxbase.org/LSB_3.0.0/LSB-PDA/LSB-PDA/usernames.html>
- <https://www.baeldung.com/linux/nobody-user>
- [Explaining blog post](https://medium.com/@mughal.asim/kubernetes-security-contexts-series-part-4-immutable-filesystem-b3d7e5d0be5c) 
