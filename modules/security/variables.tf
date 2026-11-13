variable "resource_group_name" {
  description = "Name of the Azure resource group containing the NSGs."
  type        = string
}

variable "location" {
  description = "Azure region where the NSGs are deployed."
  type        = string
}

variable "network_security_groups" {
  description = "Map of existing Network Security Groups to manage."
  type        = map(object({}))
}