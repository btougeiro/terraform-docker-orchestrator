# Security Policy

## Supported Versions

Currently, all released versions of this module are supported with security updates.

## Reporting a Vulnerability

If you discover a security vulnerability, please do NOT open a public issue. Instead, please send an email to the maintainers privately.

**Do:**
- Report vulnerabilities privately via email to the project maintainer
- Provide detailed information about the vulnerability
- Include steps to reproduce (if applicable)
- Allow the maintainers time to investigate and respond

**Don't:**
- Open public issues about security vulnerabilities
- Share exploit details publicly before a fix is released
- Use the vulnerability to harm others

## Security Best Practices for Users

### Secret Management

Docker secrets created through this module are stored in Terraform state. To protect sensitive data:

- Use remote state with encryption (e.g., S3 + KMS, Terraform Cloud, Azure Blob with customer-managed keys)
- Never commit Terraform state files to version control
- Rotate secrets regularly
- Use environment variables or secret management tools instead of hardcoding secrets in your Terraform code
- Consider using the `secrets` variable with sensitive data passed from secure sources

### Provider Configuration

The `kreuzwerker/docker` provider may require credentials for private registries. Protect these credentials:

- Use environment variables for registry credentials
- Store credentials in secret management tools (HashiCorp Vault, AWS Secrets Manager, etc.)
- Use variable definition files (`.tfvars`) that are not committed to version control
- Avoid hardcoding credentials in Terraform files

### Example Secure Configuration

```hcl
# Pass credentials from environment
provider "docker" {
  registry_auth {
    address = "registry.example.com"
    username = var.registry_username  # From environment or secret store
    password = var.registry_password  # From environment or secret store
  }
}

# Use sensitive data securely
variable "registry_username" {
  type      = string
  sensitive = true
}

variable "registry_password" {
  type      = string
  sensitive = true
}
```

## Dependencies

This module depends on:

- **OpenTofu/Terraform** (>= 1.0)
- **kreuzwerker/docker provider** (~> 4.1.0)

Keep these dependencies updated to benefit from security fixes. Monitor security advisories for both projects and update promptly when vulnerabilities are disclosed.

## Container Security

When using this module to manage containers:

- Use official or trusted base images
- Keep images updated with security patches
- Scan images for vulnerabilities before deployment
- Use least-privilege principles for container permissions
- Enable resource limits to prevent denial-of-service
- Use healthchecks to ensure container availability
- Avoid running containers as root when possible

## State File Security

Terraform state files contain sensitive information about your infrastructure:

- Use remote backends with encryption enabled
- Limit access to state files using IAM policies or RBAC
- Enable state locking to prevent concurrent modifications
- Regularly back up state files
- Use state file encryption where supported

## Response Time

The maintainers aim to respond to security reports within 48 hours and provide a timeline for remediation. Security patches will be prioritized and released as quickly as possible.

## Acknowledgments

If you report a vulnerability that leads to a security fix, you will be acknowledged in the release notes (with your permission).