# Migrating From the Legacy Attribute Model

The old `yum-centos` cookbook combined two patterns:

* node attributes under `node['yum'][repo_id]`
* the `yum-centos::default` recipe, which created repositories for every repo marked as managed

The current cookbook is resource-driven instead. There are no recipes or attribute files to include or override. You now declare the repositories you want directly in recipe code.

## What Changed

### Old model

The legacy cookbook typically looked like this:

```ruby
node.default['yum']['highavailability']['managed'] = true
node.default['yum']['highavailability']['enabled'] = true

include_recipe 'yum-centos::default'
```

That worked because the old `default` recipe iterated over `node['yum-centos']['repos']` and created `yum_repository` resources for entries whose `managed` flag was true.

### New model

The new cookbook replaces that with explicit custom resources:

```ruby
yum_centos_repositories 'default-plus-ha' do
  enable_repo_ids %w(highavailability)
end
```

Or, if you want to manage just one repo directly:

```ruby
yum_centos_repository 'highavailability' do
  enabled true
end
```

## Migration Mapping

### Enable one optional repo

Old:

```ruby
node.default['yum']['highavailability']['managed'] = true
node.default['yum']['highavailability']['enabled'] = true

include_recipe 'yum-centos::default'
```

New:

```ruby
yum_centos_repositories 'default-plus-ha' do
  enable_repo_ids %w(highavailability)
end
```

### Keep the default repos and add several optional repos

Old:

```ruby
%w(highavailability realtime).each do |repo_id|
  node.default['yum'][repo_id]['managed'] = true
  node.default['yum'][repo_id]['enabled'] = true
end

include_recipe 'yum-centos::default'
```

New:

```ruby
yum_centos_repositories 'default-plus-optionals' do
  enable_repo_ids %w(highavailability realtime)
end
```

### Override repo settings

Old:

```ruby
node.default['yum']['highavailability']['managed'] = true
node.default['yum']['highavailability']['enabled'] = true
node.default['yum']['highavailability']['gpgcheck'] = false
node.default['yum']['highavailability']['metadata_expire'] = '12h'

include_recipe 'yum-centos::default'
```

New:

```ruby
yum_centos_repositories 'default-plus-ha' do
  enable_repo_ids %w(highavailability)
  repo_overrides(
    'highavailability' => {
      'gpgcheck' => false,
      'metadata_expire' => '12h',
    }
  )
end
```

You can also apply those overrides directly to a single repo resource:

```ruby
yum_centos_repository 'highavailability' do
  enabled true
  gpgcheck false
  metadata_expire '12h'
end
```

## Legacy Names Still Accepted

Some old names map cleanly to current official CentOS Stream repo IDs. These aliases are still accepted:

* `base` -> `baseos`
* `extras` -> `extras-common`
* `powertools` -> `crb`
* `realtime` -> `rt`
* `centos-nfv` -> `nfv`
* `centos-nfv-extras` -> `nfv`

Example:

```ruby
yum_centos_repositories 'default-plus-legacy-aliases' do
  enable_repo_ids %w(powertools realtime)
end
```

That converges the current Stream repos `crb` and `rt`.

## What Is No Longer Modeled

The legacy cookbook also exposed many CentOS Linux 7/8 and SIG-specific repositories such as versioned OpenStack, Ceph, Samba, oVirt, RabbitMQ, and similar repo families.

Those are not part of the current top-level official CentOS Stream 9/10 repo set modeled by this cookbook. In the current CentOS mirror layout, many of them now live under SIG paths such as `mirror.stream.centos.org/SIGs/...` and need separate release-package or SIG-specific modeling.

In practice:

* official Stream repo IDs that CentOS publishes directly are supported here
* old versioned SIG repos are not automatically recreated by this migration
* if you still need one of those SIG repos, it should be modeled explicitly in a separate cookbook or in a future targeted expansion of `yum-centos`

## Recommended Migration Strategy

1. Remove `include_recipe 'yum-centos::default'`.
2. Remove `node['yum'][repo_id]['managed']` toggles for CentOS repos.
3. Replace them with `yum_centos_repositories` or `yum_centos_repository`.
4. Use `enable_repo_ids` when you want to keep the default repo set and add optional repos.
5. Use `repo_overrides` or single-resource properties for non-default settings.
6. Audit any old SIG/versioned repo usage separately, because those are not all represented by the new official Stream repo catalog.
