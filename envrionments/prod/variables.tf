variable "resource_group_name" {}
variable "location" {}

variable "virtual_network_name" {}
variable "address_space" {}

variable "subnet_name_01" {}
variable "address_prefixes_01" {}

variable "subnet_name_02" {}
variable "address_prefixes_02" {}

variable "nsg_name_01" {}

variable "nsg_name_02" {}

variable "nic_name_01" {}

variable "nic_name_02" {}

variable "lb_pip_name" {}

variable "linux_vm_name_01" {}

variable "linux_vm_name_02" {}

variable "linux_vm_size" {}

variable "linux_vm_01_admin_username" {}
variable "linux_vm_01_admin_password" {}

variable "linux_vm_02_admin_username" {}
variable "linux_vm_02_admin_password" {}

variable "offer" {}
variable "publisher" {}
variable "sku" {}
variable "image_version" {}

variable "lb_name" {}
variable "lb_backend_pool_name" {}
variable "lb_rule" {}
variable "lb_probe_name" {}

variable "ip_configuration_name" {}

variable "bastion_host_name" {}
variable "bastion_subnet_name" {}
variable "bastion_pip_name" {}
variable "bastion_subnet_address_prefixes" {}