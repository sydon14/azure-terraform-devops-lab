
variable "nic_ip_configuration_name" {
  description = "Name of the NIC IP configuration."
  type        = string
  default     = "ipconfig1"
}

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
