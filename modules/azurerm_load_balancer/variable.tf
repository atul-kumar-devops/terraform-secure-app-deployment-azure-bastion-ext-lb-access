variable "pip_name" {
  type        = string
  description = "Public IP Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "lb_name" {
  type        = string
  description = "Load Balancer Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "lb_backend_pool_name" {
  type = string
  description = "Load Balancer Pool Name"
}

variable "lb_rule" {
  type = string
  description = "Load Balancer Load Balancer Rule"
}

variable "lb_probe_name" {
  type = string
  description = "Load Balancer Health Probe"
}