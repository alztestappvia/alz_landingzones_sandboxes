module "orca" {
  # tflint-ignore: terraform_module_pinned_source
  source = "git::https://github.com/alztestappvia/alz_tfmod_landingzones?ref=main"

  providers = {
    azurerm = azurerm
    azuread = azuread
    azapi   = azapi
    time    = time
  }

  platform_environment = var.platform_environment
  app_environment      = var.app_environment
  billing_scope        = var.billing_scope

  rbac_type                   = "sandbox"
  state_uses_private_endpoint = false

  devops_project_name = "##DEVOPS_PROJECT_NAME##"
  management_group    = "sandboxes"
  subscription_name   = "orca"
  subscription_tags = {
    WorkloadName        = "ALZ.Core"
    DataClassification  = "General"
    BusinessCriticality = "Mission-critical"
    BusinessUnit        = "Platform Operations"
    OperationsTeam      = "Platform Operations"
  }
}
