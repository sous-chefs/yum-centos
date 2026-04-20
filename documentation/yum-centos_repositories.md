# yum-centos_repositories

Manage a collection of CentOS Stream 9/10 repositories and optionally purge the stock vendor repo files first.

## Actions

| Action | Description |
|--------|-------------|
| `:create` | Purges stock repo files and converges the selected repo IDs (default) |
| `:delete` | Removes the selected repo IDs |

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `repo_ids` | Array | built-in defaults | Repo ids to manage. Defaults to `appstream`, `baseos`, and `extras-common` |
| `repo_overrides` | Hash | `{}` | Per-repo property overrides keyed by repo id |
| `purge_vendor_files` | true, false | `true` | Deletes `/etc/yum.repos.d/centos.repo` and `/etc/yum.repos.d/centos-addons.repo` before creating managed repos |

## Examples

### Manage the default enabled repo set

```ruby
yum_centos_repositories 'default'
```

### Enable the full supported repo catalog

```ruby
yum_centos_repositories 'all' do
  repo_ids %w(
    baseos
    appstream
    extras-common
    crb
    highavailability
    nfv
    rt
    resilientstorage
  )

  repo_overrides(
    'crb' => { 'enabled' => true },
    'highavailability' => { 'enabled' => true },
    'nfv' => { 'enabled' => true },
    'rt' => { 'enabled' => true },
    'resilientstorage' => { 'enabled' => true }
  )
end
```
