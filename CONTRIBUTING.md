# Contributing

Thank you for your interest in contributing to the Terraform Docker Orchestrator module!

## How to Contribute

### Reporting Bugs

Before creating bug reports, please check the existing issues as you might find that the problem has already been reported. When creating a bug report, please include:

- A descriptive title
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- OpenTofu/Terraform version
- Provider version (`kreuzwerker/docker`)
- Any relevant configuration snippets (redact sensitive data)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please:

- Use a clear and descriptive title
- Provide a detailed description of the proposed enhancement
- Explain why this enhancement would be useful
- Provide examples of how the enhancement would be used

### Pull Requests

Pull requests are welcome! To ensure a smooth review process:

1. Fork the repository
2. Create a branch from `main` for your changes
3. Make your changes following the [Code Style](#code-style) guidelines
4. Add tests for new functionality or bug fixes
5. Update documentation as needed
6. Ensure all CI checks pass:
   - `tofu fmt -recursive` (format check)
   - `tofu validate` (root and all sub-modules)
   - `tofu test` (test suite)
   - `tflint` (linting)
7. Commit with clear messages (use conventional commits if possible)
8. Push to your fork and submit a pull request

### Version Bumping

When merging a PR that should trigger a release, add one of these labels:

- `release:major` - Breaking changes
- `release:minor` - New features, backwards compatible
- `release:patch` - Bug fixes, backwards compatible
- `release:skip` - No release needed (chore, docs, etc.)

The release workflow will automatically bump the version and create a GitHub release.

## Development Workflow

This project uses **OpenTofu**, not Terraform CLI. All commands use `tofu`.

### Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/terraform-docker-orchestrator.git
cd terraform-docker-orchestrator

# Initialize OpenTofu
tofu init -backend=false
```

### Commands

```bash
# Format
tofu fmt -recursive

# Format check (CI-equivalent)
tofu fmt -check -recursive

# Validate root module
tofu init -backend=false && tofu validate

# Validate a sub-module
cd modules/<name> && tofu init -backend=false && tofu validate

# Run tests
tofu test

# Lint root module
tofu init -backend=false && tflint --init && tflint

# Lint a sub-module
cd modules/<name> && tofu init -backend=false && tflint --init && tflint
```

### Testing

Tests are located in the `tests/` directory and use OpenTofu's native testing framework.

```bash
# Run all tests
tofu test

# Run specific test
tofu test -run "test_name"
```

## Code Style

- Use `tofu fmt -recursive` before committing (CI will check this)
- Follow existing patterns in the codebase
- Use `lookup()` for optional attributes with defaults
- Use `dynamic` blocks for complex nested objects
- All variables must have descriptions
- All outputs must have descriptions
- Keep sub-modules focused and reusable

## Module Architecture

The root module (`main.tf`) is a thin orchestrator that instantiates all 11 sub-modules. Each sub-module:

- Accepts a single `map(any)` variable (e.g., `var.containers`, `var.networks`)
- Creates resources with `for_each = var.<resource_type>`
- Uses `lookup(each.value, "key", default)` for optional attributes
- Uses `dynamic` blocks for nested objects

When adding a new attribute to any resource, follow the established pattern with `lookup` and a sane default.

## Documentation

- Update README.md for user-facing changes
- Update CHANGELOG.md for code changes (add to [Unreleased] section)
- Update relevant sub-module README.md in `modules/<name>/`
- Add examples for new features in `examples/`

## License

By contributing, you agree that your contributions will be licensed under the Apache-2.0 License.