

module "mod_deploy_vnet_sample" {
  source = "../../../modules/azure_arm_deployment/resource_group"

  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment
  deploy_environment  = "dev"
  workload_name       = "arm"

  arm_script = file("${path.module}/${var.arm_script}")

  parameters_override = {
    "vnetName" = var.vnet_name 
  }
}
