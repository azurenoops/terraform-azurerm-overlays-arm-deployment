variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
  default     = "test_group"
}

variable "deployment" {
  description = "There are only 2 allowed value for this, incremental and complete, by default it would be incremental else it would auto delete the resource that are not declared in the deployment."
  type        = string
  default     = "Incremental"
}

variable "name" {
  description = "The name of the logic app workflow."
  type        = string
  default     = "arm_vnet"
}

variable "arm_script" {
  description = "This is the ARM Json file that would be deployed, this is located in the same directory as your terraform scripts."
  type        = string
  default     = "vnet.json"
}

variable "vnet_name" {
  description = "This will be the name of the web app resource that we would be creating."
  type        = string
  default     = "arm-vnet-example"
}