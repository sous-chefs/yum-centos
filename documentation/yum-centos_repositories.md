# yum-centos_repositories

Manage a collection of CentOS Stream 9/10 repositories and optionally purge the stock vendor repo files first.

See [MIGRATION.md](../MIGRATION.md) for migration examples from the old `node['yum'][repo_id]` attribute model.

## Actions

- `:create`: Purges stock repo files and converges the selected repo IDs.
- `:delete`: Removes the selected repo IDs.

## Properties

- `repo_ids`: `Array`, default built-in defaults. Repo ids to manage. Defaults to `appstream`, `baseos`, and `extras-common`.
- `enable_repo_ids`: `Array`, default `[]`. Additional repo ids to manage and enable without restating the default repo set.
- `repo_overrides`: `Hash`, default `{}`. Per-repo property overrides keyed by repo id.
- `purge_vendor_files`: `true, false`, default `true`. Deletes `/etc/yum.repos.d/centos.repo` and `/etc/yum.repos.d/centos-addons.repo` before creating managed repos.

## Examples

### Manage the default enabled repo set

```ruby
yum_centos_repositories 'default'
```

### Enable the full supported repo catalog

```ruby
yum_centos_repositories 'all' do
  enable_repo_ids %w(crb highavailability nfv rt resilientstorage)
end
```

### Enable one optional repo without restating the defaults

```ruby
yum_centos_repositories 'default-plus-ha' do
  enable_repo_ids %w(highavailability)
end
```

### Legacy alias names accepted for current official Stream repos

```ruby
yum_centos_repositories 'default-plus-legacy-aliases' do
  enable_repo_ids %w(powertools realtime)
end
```

## Migration

If you previously enabled repos with attribute toggles such as:

```ruby
node.default['yum']['highavailability']['managed'] = true
node.default['yum']['highavailability']['enabled'] = true

include_recipe 'yum-centos::default'
```

replace that with:

```ruby
yum_centos_repositories 'default-plus-ha' do
  enable_repo_ids %w(highavailability)
end
```

For more detailed mappings and caveats, see [MIGRATION.md](../MIGRATION.md).
