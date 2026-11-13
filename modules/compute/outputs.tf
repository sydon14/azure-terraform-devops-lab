output "vm_id" {
  description = "Resource ID of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "Name of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.this.name
}

output "nic_id" {
  description = "Resource ID of the virtual machine network interface."
  value       = azurerm_network_interface.this.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the VM network interface."
  value       = azurerm_network_interface.this.private_ip_address
}

output "public_ip_id" {
  description = "Resource ID of the existing public IP."
  value       = azurerm_public_ip.this.id
}

output "public_ip_address" {
  description = "Public IP address assigned to the VM."
  value       = azurerm_public_ip.this.ip_address
}