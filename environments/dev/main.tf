module "networking" {
  source = "../../modules/networking"

  resource_group_name = var.resource_group_name
  location            = var.location

  vnet_name     = "vnet-azure-devops-lab-dev"
  address_space = ["10.10.0.0/16"]

  subnets = {
    "snet-app-dev" = {
      address_prefixes = ["10.10.1.0/24"]
    }

    "snet-data-dev" = {
      address_prefixes = ["10.10.2.0/24"]
    }
  }
}