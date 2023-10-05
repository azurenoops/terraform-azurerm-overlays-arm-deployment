# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###############
# Outputs    ##
###############

output "id" {
  description = "The unique identifier of the ARM template deployment."
  value       = azurerm_tenant_template_deployment.tenant_deploy.id
}

output "output_content" {
  description = "The JSON content of the outputs of the ARM template deployment."
  value       = azurerm_tenant_template_deployment.tenant_deploy.output_content
}