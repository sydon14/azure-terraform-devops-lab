resource "azurerm_network_security_group" "this" {
  for_each = var.network_security_groups

  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
}