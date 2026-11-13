terraform {
  required_version = ">= 1.11.0, < 2.0.0"

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-devops"
    storage_account_name = "sttfdevopsb904077c"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
    use_azuread_auth     = true
    use_cli              = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}