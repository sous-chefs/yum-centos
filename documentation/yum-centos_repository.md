# yum-centos_repository

Manage one CentOS Stream 9/10 DNF repository definition.

## Actions

| Action | Description |
|--------|-------------|
| `:create` | Creates the main, debuginfo, and source repo definitions for the selected repo ID (default) |
| `:delete` | Removes the main, debuginfo, and source repo definitions |

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `repo_id` | String | name property | Built-in CentOS repo id such as `baseos`, `appstream`, `extras-common`, or `crb` |
| `description` | String, nil | built-in value | Repo description override |
| `baseurl` | String, nil | built-in value | Base URL override |
| `metalink` | String, nil | built-in value | Metalink override |
| `gpgkey` | String, nil | built-in value | GPG key override |
| `gpgcheck` | true, false, nil | built-in value | Enable or disable package signature verification |
| `repo_gpgcheck` | true, false, nil | built-in value | Enable or disable repodata signature verification |
| `metadata_expire` | String, nil | built-in value | Metadata refresh interval |
| `enabled` | true, false, nil | built-in value | Enables or disables the main repo |
| `debug_enabled` | true, false | `false` | Enables or disables the debuginfo repo |
| `source_enabled` | true, false | `false` | Enables or disables the source repo |
| `options` | Hash | `{}` | Additional `yum_repository` options |

## Examples

### Manage a stock repo

```ruby
yum_centos_repository 'baseos'
```

### Enable an optional repo

```ruby
yum_centos_repository 'crb' do
  enabled true
end
```

### Pass through extra yum options

```ruby
yum_centos_repository 'extras-common' do
  options(
    'priority' => '10'
  )
end
```
