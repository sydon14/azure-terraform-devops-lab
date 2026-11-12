
variable "subscription_id" {
  description = "Azure subscription ID for the development environment."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the existing development resource group."
  type        = string
  default     = "rg-azure-devops-lab-dev"
}

variable "location" {
  description = "Azure region for the development environment."
  type        = string
  default     = "eastus"
}
