#!/bin/bash

# -----------------------------------------------------------------------------
# AUTO-GENERATE TERRAFORM DOCUMENTATION
# -----------------------------------------------------------------------------

# Use local terraform-docs if available, otherwise fallback to system path
if [ -f "./terraform-docs" ]; then
  TD="./terraform-docs"
else
  TD="terraform-docs"
fi

# Root module
echo "Updating documentation for root module..."
$TD markdown table --output-file README.md --output-mode inject .

# Sub-modules
for dir in modules/*/; do
  if [ -f "${dir}main.tf" ]; then
    echo "Updating documentation for sub-module: ${dir}"
    $TD markdown table --output-file README.md --output-mode inject "${dir}"
  fi
done

echo "Documentation updated successfully."
