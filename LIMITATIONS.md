# Limitations

## Official support target

This cookbook officially targets CentOS Stream 9 and CentOS Stream 10 only.

- CentOS Stream 9 remains in scope because the CentOS Stream 9 timeline lists its expected end of life as the end of the RHEL 9 full support phase, estimated in 2027. Sources: https://www.centos.org/stream9/ and https://www.centos.org/download/index.html
- CentOS Stream 10 remains in scope because the CentOS Stream 10 release notes state that it is maintained until 2030. Source: https://www.centos.org/centos10/
- CentOS Stream 8 is out of scope because the CentOS project announced its end of builds on 2024-05-31. Sources: https://blog.centos.org/2023/04/end-dates-are-coming-for-centos-stream-8-and-centos-linux-7/ and https://centos.org/centos-linux/
- CentOS Linux 7 is out of scope because the CentOS project lists its end of life as 2024-06-30. Sources: https://blog.centos.org/2023/04/end-dates-are-coming-for-centos-stream-8-and-centos-linux-7/ and https://centos.org/centos-linux/

## Repository and architecture findings

- The live CentOS Stream mirror indexes for `9-stream` and `10-stream` currently show `BaseOS`, `AppStream`, and `CRB` publishing `aarch64`, `ppc64le`, `s390x`, and `x86_64`. Sources: https://mirror.stream.centos.org/9-stream/BaseOS/ https://mirror.stream.centos.org/9-stream/AppStream/ https://mirror.stream.centos.org/9-stream/CRB/ https://mirror.stream.centos.org/10-stream/BaseOS/ https://mirror.stream.centos.org/10-stream/AppStream/ https://mirror.stream.centos.org/10-stream/CRB/
- The live `9-stream/ResilientStorage` mirror currently publishes `ppc64le`, `s390x`, and `x86_64`, but not `aarch64`. Source: https://mirror.stream.centos.org/9-stream/ResilientStorage/
- The live `10-stream/RT` mirror currently publishes `aarch64` and `x86_64`. Source: https://mirror.stream.centos.org/10-stream/RT/
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
