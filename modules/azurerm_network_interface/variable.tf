variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network Name"
}

variable "nic_name" {
  type        = string
  description = "Network Interface Card"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "nsg_name" {
  type        = string
  description = "Network Security Group Name"
}
