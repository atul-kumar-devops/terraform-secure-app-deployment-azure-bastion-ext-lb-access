variable "nic_name" {
  type        = string
  description = "Network Interface Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "linux_vm_name" {
  type        = string
  description = "Linux Virtual Machine Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "linux_vm_size" {
  type        = string
  description = "Linux Virtual Machine Size"
}

variable "linux_vm_admin_username" {
  type        = string
  description = "Linux Virtual Machine Admin Username"
}

variable "linux_vm_admin_password" {
  type        = string
  description = "Linux Virtual Machine Admin Password"
}

variable "publisher" {
  type        = string
  description = "VM Image Publisher"
}

variable "offer" {
  type        = string
  description = "VM Image Offer"
}

variable "sku" {
  type        = string
  description = "VM Image SKU"
}

variable "image_version" {
  type        = string
  description = "VM Image version"
}
