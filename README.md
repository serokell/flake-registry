# Serokell Flake Registry

This is a flake registry that is used to update inputs in all our projects.

## How it works

There are two types of inputs in this registry: unlocked and locked.

Unlocked entries are useful only as a way to reduce boilerplate input code in flakes: they map an "indirect" flake reference (such as `nixpkgs`) to a concrete flake URI (such as `github:serokell/nixpkgs`). It is also technically possible to "pin" a specific revision (such as `github:serokell/nixpkgs/cd8a8bab4b70d0ff77c1ab84f8b64484865a5a63`) using unlocked entries, but it is not recommended since updating such entries is painful.

Locked entries map an indirect flake reference (such as `haskell-nix`) to a flake lock (which includes the git revision and a narHash). They are the recommended way to "pin" inputs since updating is possible without manually figuring out the latest revision.

## Maintaining

Currently the patch that allows to edit custom registries with `nix registry` is only available in `github:serokell/nix?ref=balsoft/registry`. So, get it with

```console
nix shell 'github:serokell/nix?ref=balsoft/registry'
```

### Adding a new unlocked entry

```
nix registry add --registry ./flake-registry.json nixpkgs github:serokell/nixpkgs
```

### Adding or updating a locked entry

```
nix registry pin --registry ./flake-registry.json haskell-nix github:input-output-hk/haskell.nix
```

### Removing an entry (take care when doing this)

```
nix registry remove --registry ./flake-registry.json haskell-nix
```
