#!/bin/bash

# -----------------------------------------------------------------------------
# AUTO-GENERATE TERRAFORM DOCUMENTATION
# -----------------------------------------------------------------------------

# Root module
echo "Updating documentation for root module..."
terraform-docs markdown table --output-file README.md --output-mode inject .

# Sub-modules
for dir in modules/*/; do
  if [ -f "${dir}main.tf" ]; then
    echo "Updating documentation for sub-module: ${dir}"
    terraform-docs markdown table --output-file README.md --output-mode inject "${dir}"
  fi
done

echo "Documentation updated successfully."
