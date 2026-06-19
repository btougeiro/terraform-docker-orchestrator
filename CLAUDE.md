# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Runtime

This repo uses **OpenTofu** (`tofu`), not the `terraform` CLI. Use `tofu` for all commands.

## Commands

```bash
# Format
tofu fmt -recursive

# Format check (CI-equivalent)
tofu fmt -check -recursive

# Validate root module
tofu init -backend=false && tofu validate

# Validate a sub-module
cd modules/<name> && tofu init -backend=false && tofu validate

# Lint root module
tofu init -backend=false && tflint --init && tflint

# Lint a sub-module
cd modules/<name> && tofu init -backend=false && tflint --init && tflint
```

CI runs format check → root validate → all sub-module validates → root lint → all sub-module lints. Always run `tofu fmt -recursive` before committing.

## Architecture

The root module (`main.tf`) is a thin orchestrator: it instantiates all 11 sub-modules and passes each a single map variable. Callers only interact with the root module; sub-modules are never called directly by end users.

```
root (main.tf)
├── modules/network          # docker_network
├── modules/volume           # docker_volume
├── modules/config           # docker_config
├── modules/secret           # docker_secret
├── modules/image            # docker_image (pull)
├── modules/registry_image   # docker_registry_image (push)
├── modules/plugin           # docker_plugin
├── modules/tag              # docker_tag
├── modules/buildx_builder   # docker_buildx_builder
├── modules/container        # docker_container — depends_on network/volume/config/secret/image
└── modules/service          # docker_service (Swarm)
```

**Provider:** `kreuzwerker/docker ~> 4.1.0`

## Sub-module pattern

Every sub-module follows the same shape:
- Accepts a single `map(any)` variable (e.g. `var.containers`, `var.networks`).
- Creates resources with `for_each = var.<resource_type>`.
- All optional attributes use `lookup(each.value, "key", default)`.
- Complex nested objects use `dynamic` blocks with inner `lookup` calls.

When adding a new attribute to any resource, follow this pattern — `lookup` with a sane default so callers only set what they need.

## Examples

`examples/` contains standalone usage examples (`docker-container`, `docker-network`, `docker-volume`, `docker-config`, `stack`). Each has its own `versions.tf` and is not connected to the root module.
