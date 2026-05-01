---
date: 2026-04-18
tags: [ homelab, postgresql, longhorn, kubernetes ]
---

# Homelab: Backing up

Recovery Point Objective (RPO):
    The maximum targeted period in which data might be lost from an IT service due to a major incident.

Recovery Time Objective (RTO):
    The targeted duration of time and a service level within which a business process must be restored after a disaster (or disruption) in order to avoid unacceptable consequences associated with a breakage in business continuity.

Physical backup:
    Copying the database files

Logical backup:
    Storing the steps to re-create the database

Physical backups:
    full: all files copied
    incremental: changes to the files since a previous backup, full or incremental
    (differential): incremental, but previous is a guaranteed full

Transactional logs:
    logs of logical operations, prior to writing new data to disk, i.e. persist it

Point-in-time-recovery (PITR):
    a feature, allowing reconstructing the database at any point in time starting after the latest base backup

Best practise is using frequent base physical backups, moving up with incremental backups, such that the base backup is never too far behind.
Transaction logs on top of the latest base backup, are basically a combination of physical and logical backup, that allows PITR.

## Postgres-specifics

<https://docs.pgbarman.org/release/3.18.0/user_guide/concepts.html#pg-dump-vs-pg-basebackup>

`pg_dump` is essentially, logical backup for postgres.

`pg_basebackup` is essentially, physical backup for postgres.
There is also a low-level API to accomplish similar base backups.
[Barman] uses this low-level API to allow for different backup tools, like `rsync`.

Transaction logs are called `Write-ahead logs (WAL)`.
These logs are stored until certain *checkpoints* and not directly written to disks.

Postgres supports an `archive_command` to store these WALs elsewhere before they are recycled, or `pg_receivewal` which uses a streaming protocol.

## Barman

    Streaming  backup only targets S3, and has to have a server running.
    There is also an option of running  backups with rsync, but those are not streaming and require copying to disk first.
    scripts like barman-cloud do not support anything but S3, Azure blob storage, GCS

## CloudNativePG

    only supports barman-cloud scripts for  backup, i.e. S3, Azure blob storage, GCS

## References

- <https://www.postgresql.org/docs/current/backup.html>
- <https://cloudnative-pg.io/docs/1.29/backup>
- *<https://docs.pgbarman.org/release/3.18.0/user_guide/concepts.html>*
- <https://longhorn.io/docs/1.11.1/snapshots-and-backups/backup-and-restore/create-a-backup/>
- [Barman]

- <https://github.com/zalando/postgres-operator/blob/master/docs/reference/cluster_manifest.md>
- <https://www.postgresql.org/docs/current/backup.html>
- <https://longhorn.io/docs/1.11.1/snapshots-and-backups/backup-and-restore/create-a-backup/>
- <https://cloudnative-pg.io/docs/1.29/backup>
- <https://cloudnative-pg.io/plugin-barman-cloud/docs/object_stores/>
- <https://docs.pgbarman.org/release/3.18.0/user_guide/barman_cloud.html#barman-cloud-client-package>
- <https://docs.pgbarman.org/release/3.18.0/user_guide/backup.html#backup-streaming-backup-cloud>
- <https://docs.pgbarman.org/release/3.18.0/user_guide/concepts.html#pg-dump-vs-pg-basebackup>
- <https://www.ovhcloud.com/en/>

[Barman]: <https://pgbarman.org/>
