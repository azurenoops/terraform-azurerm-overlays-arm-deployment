
##########################################################################################
# DEPLOY AN AZURE RESOURCE MANAGER TEMPLATE                                            ###
# Deploys an Azure Resource Manager (ARM) template with the following config options.  ###
##########################################################################################

resource "azurerm_resource_group_template_deployment" "resource_group_deploy" {
  lifecycle {
    # The use of `SecureString`-typed parameters causes a perma-diff (the Azure API always returns
    # an empty string). We're ignoring changes to this property, but you can track these changes
    # by templating a hash of the parameters into the template itself.
    ignore_changes = [parameters_content]
  }

  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  tags                = local.default_tags

  template_content   = var.arm_script
  parameters_content = jsonencode({ for k, v in var.parameters_override : k => { value = v } })
}
