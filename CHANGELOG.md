# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2024-06-20

### Added
- Initial public release of Terraform Docker Orchestrator module
- Support for 11 Docker resource types through unified module interface:
  - `networks` - Docker network management
  - `volumes` - Docker volume management
  - `configs` - Docker Swarm configs
  - `secrets` - Docker Swarm secrets
  - `images` - Docker image pull management
  - `registry_images` - Docker registry image build and push
  - `plugins` - Docker plugin management
  - `tags` - Docker image tagging
  - `buildx_builders` - Docker Buildx builder configuration
  - `containers` - Docker container management
  - `services` - Docker Swarm service management
- Consistent map-based variable pattern for all resource types
- Optional attributes with sensible defaults using `lookup()`
- Dynamic blocks for complex nested configurations
- Dependency management for containers (depends_on network/volume/config/secret/image)
- Comprehensive examples directory with 5 complete usage scenarios:
  - docker-container - Standalone container configuration
  - docker-network - Network with custom subnet
  - docker-volume - Local and NFS volumes
  - docker-config - Swarm config from file
  - stack - Full multi-container stack
- Complete CI/CD pipeline:
  - OpenTofu format, validate, test, and lint checks
  - Automated release workflow with semantic versioning
  - PR label-based version bumping (major/minor/patch/skip)
- OpenTofu test coverage for core module functionality
- TFLint configuration for code quality
- Apache 2.0 license

[Unreleased]: https://github.com/btougeiro/terraform-docker-orchestrator/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/btougeiro/terraform-docker-orchestrator/releases/tag/v1.0.0