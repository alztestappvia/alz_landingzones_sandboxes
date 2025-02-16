<!-- BEGIN_TF_DOCS -->
# ALZ.LandingZones.Apps

## Overview

This Terraform repository uses the internal `Terraform.LandingZones` module to provision Azure Subscriptions with some pre-configured defaults, such as:
- A Service Principal and associated Connection within Azure DevOps for the provided project
- A Terraform State bucket which can be used within Azure DevOps pipelines
- An Azure DevOps Variable Group containing details for the Terraform State bucket and Subscription IDs

**Note:** Within this repository, only **Sandbox Subscriptions** (those which are not connected to the hub/on prem) should be defined.  These subscriptions should be short lived (max 2-4 weeks) and are used for testing and development purposes.

## Updating Docs

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:
1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject terraform/`

## Release Process

The `Terraform.LandingZones` module is automatically tagged upon merge to the `main` branch. When a new version of the module is released, the `ALZ.LandingZones.Sandboxes` repository should be updated to use the new version. This is done by updating the `source` parameter in the `main.tf` file to point to the new version.

Any changes to Landing Zones should be performed on a feature branch and merged to the `main` branch once approved. The `main` branch is protected and requires at least one approval before merging. The below diagram shows the release process for a Sandbox Landing Zone:

![sandboxes](sandboxes.png)

## Required Pipeline Variables

The following variables are required to be set before running Terraform:
- platform_environment: All Application Landing Zone environments (`dev`, `pre`, `prd`) are deployed to the **Prod** Azure Tenant.
- core_storage_account_name: Read access is required to the Core Storage Account and the Terraform State within it. The State file contains the IDs for the Azure VWAN Hubs (provisioned by `ALZ.Connectivity`), which are required for connecting the Landing Zone to the Hub Network.
- devops_org_name: The name of the Azure DevOps organisation all projects are located.
- devops_pat: An Azure DevOps Personal Access Token for authentication.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_environment"></a> [app\_environment](#input\_app\_environment) | The subscription environment to deploy | `string` | `"sandbox"` | no |
| <a name="input_core_storage_account_name"></a> [core\_storage\_account\_name](#input\_core\_storage\_account\_name) | Sets the name of the storage account to retrieve the core tfstate outputs from | `string` | n/a | yes |
| <a name="input_devops_org_name"></a> [devops\_org\_name](#input\_devops\_org\_name) | The name of the Azure DevOps organisation | `string` | `"##DEVOPS_ORG_NAME##"` | no |
| <a name="input_devops_pat"></a> [devops\_pat](#input\_devops\_pat) | The Azure DevOps personal access token | `string` | n/a | yes |
| <a name="input_platform_environment"></a> [platform\_environment](#input\_platform\_environment) | The platform environment (tenant) | `string` | `"Test"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->