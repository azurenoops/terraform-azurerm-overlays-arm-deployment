# Azure Resource Manager Deployment Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-arm-deployment/azurerm/)

This Overlay terraform module contains modules for deploying and managing Azure Resource Manager to deploy ARM script templates written in JSON to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Contributing

If you want to contribute to this repository, please feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Got feedback

Please leverage issues if you have any feedback or request on how we can improve on this repository.

## ARM Deployment Resource Group

### Example Usage

```hcl  
module "mod_deploy_arm_rg" {  
  source = "azurenoops/overlays-arm-deployment/azurerm//modules/resource_group"  
  version = "x.x.x"  
  
  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment
  deploy_environment  = "dev"
  workload_name       = "arm"

  arm_script = file("${path.module}/${var.arm_script}")

  parameters_override = {
    "webAppName" = var.web_app_name 
  }
}
```

## How the parameters_override works

The ARM template can be customize further using parameters similarly to how you will be deploying using
[az deployment](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli#parameters).

An example of this, you can reference the parameter, snippet shown below from a ARM deployment template in JSON.

```JSON
"parameters": {
    "webAppName": { "type": "String" },
    "virtualApplications":{
      "type": "array",
      "defaultValue":
      [
        {
          "virtualPath": "/",
          "physicalPath": "site\\wwwroot",
          "preloadEnabled": false,
          "virtualDirectories": null
        }
      ]
    }
  }
```

We can use parameters_override to change the values of any variables found inside parameter.

```terraform
  parameters_override = {
     webAppName = { value = var.web_app_name }
  }
```

## Further reading

You can get the ARM (Azure Resource Manager) template schema from:
[ARM template file structure](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-syntax)

Best practices are also define in:
[Template best practices](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-best-practices)

**WARNING: You would always want your deployment to be set to incremental.**
>
> * **Complete** - where resources in the Resource Group not specified in the ARM Template will be destroyed.
> Resources within this Resource Group which are not defined in the ARM Template will be deleted.
> * **Incremental** - where resources are additive only.

