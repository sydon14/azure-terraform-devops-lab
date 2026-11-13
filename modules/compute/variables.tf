
# --------------------------------------------------
# General Configuration
# --------------------------------------------------

variable "resource_group_name" {
  description = "Resource group containing the compute resources."
  type        = string
}

variable "location" {
  description = "Azure region for compute resources."
  type        = string
}

# --------------------------------------------------
# Virtual Machine Configuration
# --------------------------------------------------

variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Azure virtual machine size."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the VM."
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key used for VM authentication."
  type        = string
}

# --------------------------------------------------
# Networking Configuration
# --------------------------------------------------

variable "subnet_id" {
  description = "ID of the subnet hosting the VM."
  type        = string
}

variable "nic_name" {
  description = "Name of the VM network interface."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the existing public IP resource."
  type        = string
}

variable "nic_ip_configuration_name" {
  description = "Name of the NIC IP configuration."
  type        = string
  default     = "ipconfig1"
}

# --------------------------------------------------
# Operating System Disk Configuration
# --------------------------------------------------

variable "os_disk_name" {
  description = "Name of the existing VM operating system disk."
  type        = string
}

variable "os_disk_caching" {
  description = "OS disk caching mode."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "OS disk storage SKU."
  type        = string
  default     = "StandardSSD_ZRS"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB."
  type        = number
  default     = 30
}

# --------------------------------------------------
# Ubuntu Image Configuration
# --------------------------------------------------

variable "image_publisher" {
  description = "VM image publisher."
  type        = string
  default     = "canonical"
}

variable "image_offer" {
  description = "VM image offer."
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "image_sku" {
  description = "VM image SKU."
  type        = string
  default     = "server"
}

variable "image_version" {
  description = "VM image version."
  type        = string
  default     = "latest"
}
