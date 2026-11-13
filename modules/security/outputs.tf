output "nsg_ids" {
  description = "Map of Network Security Group names to their Azure resource IDs."

  value = {
    for name, nsg in azurerm_network_security_group.this :
    name => nsg.id
  }
}