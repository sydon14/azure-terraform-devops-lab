
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

module "security" {
  source = "../../modules/security"

  resource_group_name = var.resource_group_name
  location            = var.location

  network_security_groups = {
    "nsg-app-dev"  = {}
    "nsg-data-dev" = {}
  }

  security_rules = {
    "app-ssh" = {
      name                       = "Allow-SSH-MyIP"
      nsg_name                   = "nsg-app-dev"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "65.187.154.49/32"
      destination_address_prefix = "*"
    }

    "app-http" = {
      name                       = "Allow-HTTP-MyIP"
      nsg_name                   = "nsg-app-dev"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "65.187.154.49/32"
      destination_address_prefix = "*"
    }

    "data-sql" = {
      name                       = "Allow-App-To-Database-1433"
      nsg_name                   = "nsg-data-dev"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.10.1.0/24"
      destination_address_prefix = "10.10.2.0/24"
    }

    "data-deny" = {
      name                       = "Deny-Other-VNet-To-Data"
      nsg_name                   = "nsg-data-dev"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "10.10.2.0/24"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = {
    "snet-app-dev"  = "nsg-app-dev"
    "snet-data-dev" = "nsg-data-dev"
  }

  subnet_id                 = module.networking.subnet_ids[each.key]
  network_security_group_id = module.security.nsg_ids[each.value]
}