
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

variable "security_rules" {
  description = "Map of Network Security Group rules to manage."

  type = map(object({
    name                       = string
    description                = optional(string)
    nsg_name                   = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
