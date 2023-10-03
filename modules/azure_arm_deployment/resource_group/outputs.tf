# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###############
# Outputs    ##
###############

output "id" {
  description = "The unique identifier of the ARM template deployment."
  value       = azurerm_resource_group_template_deployment.resource_group_deploy.id
}

output "output_content" {
  description = "The JSON content of the outputs of the ARM template deployment."
  value       = azurerm_resource_group_template_deployment.resource_group_deploy.output_content
}
