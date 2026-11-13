
# Existing Azure Public IP
resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location

  allocation_method       = "Static"
  sku                     = "Standard"
  sku_tier                = "Regional"
  ip_version              = "IPv4"
  idle_timeout_in_minutes = 4
}

# Existing Azure VM Network Interface
resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location

  accelerated_networking_enabled = true
  ip_forwarding_enabled          = false

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    primary                       = true
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# Existing Azure Ubuntu Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  computer_name  = var.vm_name
  admin_username = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  disable_password_authentication = true
  provision_vm_agent              = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  secure_boot_enabled = true
  vtpm_enabled        = true

  patch_mode            = "ImageDefault"
  patch_assessment_mode = "ImageDefault"

  boot_diagnostics {}

  lifecycle {
    prevent_destroy = true
  }
}
