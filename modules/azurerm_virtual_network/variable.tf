variable "vnet_name" {
  type        = string
  description = "Virtual Network Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "address_space" {
  type        = list(string)
  description = "Address Space"
}
