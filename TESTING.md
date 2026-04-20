# Testing

Install Cinc Workstation or Chef Workstation, then install the local integration cookbook:

```shell
berks install --only integration
```

Run lint and the unit test suite:

```shell
cookstyle
chef exec rspec
```

Run the Dokken integration suites that match CI:

```shell
KITCHEN_LOCAL_YAML=kitchen.dokken.yml kitchen test default-centos-stream-9 --destroy=always
KITCHEN_LOCAL_YAML=kitchen.dokken.yml kitchen test all-centos-stream-10 --destroy=always
```

The CI matrix in `.github/workflows/ci.yml` runs the cartesian product of `default` and `all` across `centos-stream-9` and `centos-stream-10` on `ubuntu-latest`.
