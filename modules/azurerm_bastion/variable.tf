variable "subnet_name" {
  type        = string
  description = "Azure Bastion Host Subnet Name"
}

variable "vnet_name" {
  type        = string
  description = "Load Balancer Virtual Network"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "bastion_host_name" {
  type        = string
  description = "Azure Bastion Host Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "pip_name" {
  type        = string
  description = "Public IP Name"
}
