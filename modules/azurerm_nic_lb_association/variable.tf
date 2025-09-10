variable "nic_name" {
  type        = string
  description = "Network Interface For Load Balancer"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "lb_name" {
  type        = string
  description = "Load Balancer Name"
}

variable "lb_backend_pool_name" {
  type        = string
  description = "Load Balancer-Backend Pool Name"
}
