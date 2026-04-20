# Limitations

## Official support target

This cookbook officially targets CentOS Stream 9 and CentOS Stream 10 only.

- CentOS Stream 9 remains in scope because the [CentOS Stream 9 timeline](https://www.centos.org/stream9/) lists its expected end of life as the end of the RHEL 9 full support phase, estimated in 2027. See also the [CentOS download index](https://www.centos.org/download/index.html).
- CentOS Stream 10 remains in scope because the [CentOS Stream 10 release notes](https://www.centos.org/centos10/) state that it is maintained until 2030.
- CentOS Stream 8 is out of scope because the CentOS project announced its end of builds on 2024-05-31 in [End dates are coming for CentOS Stream 8 and CentOS Linux 7](https://blog.centos.org/2023/04/end-dates-are-coming-for-centos-stream-8-and-centos-linux-7/). See also [CentOS Linux](https://centos.org/centos-linux/).
- CentOS Linux 7 is out of scope because the CentOS project lists its end of life as 2024-06-30 in [End dates are coming for CentOS Stream 8 and CentOS Linux 7](https://blog.centos.org/2023/04/end-dates-are-coming-for-centos-stream-8-and-centos-linux-7/). See also [CentOS Linux](https://centos.org/centos-linux/).

## Repository and architecture findings

- The live CentOS Stream mirror indexes for `9-stream` and `10-stream` currently show `BaseOS`, `AppStream`, and `CRB` publishing `aarch64`, `ppc64le`, `s390x`, and `x86_64`. Sources: [9-stream BaseOS](https://mirror.stream.centos.org/9-stream/BaseOS/), [9-stream AppStream](https://mirror.stream.centos.org/9-stream/AppStream/), [9-stream CRB](https://mirror.stream.centos.org/9-stream/CRB/), [10-stream BaseOS](https://mirror.stream.centos.org/10-stream/BaseOS/), [10-stream AppStream](https://mirror.stream.centos.org/10-stream/AppStream/), and [10-stream CRB](https://mirror.stream.centos.org/10-stream/CRB/).
- The live `9-stream/ResilientStorage` mirror currently publishes `ppc64le`, `s390x`, and `x86_64`, but not `aarch64`. Source: [9-stream ResilientStorage](https://mirror.stream.centos.org/9-stream/ResilientStorage/).
- The live `10-stream/RT` mirror currently publishes `aarch64` and `x86_64`. Source: [10-stream RT](https://mirror.stream.centos.org/10-stream/RT/).
- Local Dokken validation on `aarch64` on 2026-04-20 showed `crb`, `highavailability`, and `rt` resolving metadata successfully on CentOS Stream 9 and 10, while `nfv` and `resilientstorage` returned mirrorlist 404s on both releases. The `all` integration suite now enables only the optional repos that publish metadata on the current architecture.

## Live container repo IDs

On 2026-04-20, the official container images `quay.io/centos/centos:stream9` and `quay.io/centos/centos:stream10` reported the following repo IDs via `dnf repolist --all`:

- `baseos`
- `appstream`
- `crb`
- `extras-common`
- `highavailability`
- `nfv`
- `rt`
- `resilientstorage`

Those live container results align with the repo IDs managed by `yum_centos_repository` and `yum_centos_repositories`.
