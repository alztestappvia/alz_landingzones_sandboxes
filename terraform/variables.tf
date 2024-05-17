variable "devops_org_name" {
  type        = string
  description = "The name of the Azure DevOps organisation"
  default     = "##DEVOPS_ORG_NAME##"
}

variable "devops_pat" {
  type        = string
  description = "The Azure DevOps personal access token"
  sensitive   = true
  default     = null
}

variable "github_token" {
  type        = string
  description = "A GitHub OAuth / Personal Access Token"
  sensitive   = true
  default     = null
}

variable "github_owner" {
  type        = string
  description = "The GitHub organization"
  default     = "alztestappvia"
}

variable "platform_environment" {
  type        = string
  description = "The platform environment (tenant)"
  default     = "Test"

  validation {
    condition = contains(
      ["Test", "Prod"],
      var.platform_environment
    )
    error_message = "Error: platform_environment must be one of: Test, Prod."
  }
}

variable "app_environment" {
  type        = string
  description = "The subscription environment to deploy"
  default     = "sandbox"

  validation {
    condition = contains(
      ["sandbox"],
      var.app_environment
    )
    error_message = "Error: app_environment must be one of: dev, pre, prd."
  }
}

variable "billing_scope" {
  type        = string
  description = "The billing scope for the subscription"
  default     = "/providers/Microsoft.Billing/billingAccounts/xxxx/billingProfiles/xxxx/invoiceSections/xxxx"
}

variable "use_oidc" {
  type        = bool
  description = "Use OpenID Connect to authenticate to AzureRM"
  default     = false
}
