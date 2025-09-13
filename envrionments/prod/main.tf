module "resource_group" {
  source              = "../../modules/azurerm_resource_group"
  resource_group_name = var.resource_group_name
  location            = "centralus"
}

module "virtual_network" {
  depends_on           = [module.resource_group]
  source               = "../../modules/azurerm_virtual_network"
  virtual_network_name = var.virtual_network_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  address_space        = var.address_space
}

module "subnet_01" {
  depends_on           = [module.virtual_network]
  source               = "../../modules/azurerm_subnet"
  subnet_name          = var.subnet_name_01
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.address_prefixes_01
}

module "subnet_02" {
  depends_on           = [module.virtual_network]
  source               = "../../modules/azurerm_subnet"
  subnet_name          = var.subnet_name_02
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.address_prefixes_02
}

module "nsg_01" {
  depends_on          = [module.resource_group]
  source              = "../../modules/azurerm_network_security_group"
  nsg_name            = var.nsg_name_01
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "nsg_02" {
  depends_on          = [module.resource_group]
  source              = "../../modules/azurerm_network_security_group"
  nsg_name            = var.nsg_name_02
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "network_interface_01" {
  depends_on           = [module.subnet_01, module.nsg_01]
  source               = "../../modules/azurerm_network_interface"
  nic_name             = var.nic_name_01
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name_01
  virtual_network_name = var.virtual_network_name
  nsg_name             = var.nsg_name_01
}

module "network_interface_02" {
  depends_on           = [module.subnet_02, module.nsg_02]
  source               = "../../modules/azurerm_network_interface"
  nic_name             = var.nic_name_02
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name_02
  virtual_network_name = var.virtual_network_name
  nsg_name             = var.nsg_name_02
}

# module "public_ip" {
#   source              = "../../modules/azurerm_public_ip"
#   pip_name            = var.pip_name_02
#   resource_group_name = var.resource_group_name
#   location            = var.location
# }

module "linux_virtual_machine_01" {
  depends_on              = [module.network_interface_01]
  source                  = "../../modules/azurerm_linux_virtual_machine"
  linux_vm_name           = var.linux_vm_name_01
  resource_group_name     = var.resource_group_name
  location                = var.location
  linux_vm_size           = var.linux_vm_size
  linux_vm_admin_username = var.linux_vm_01_admin_username
  linux_vm_admin_password = var.linux_vm_01_admin_password
  nic_name                = var.nic_name_01
  publisher               = var.publisher
  offer                   = var.offer
  sku                     = var.sku
  image_version           = var.image_version
}


module "linux_virtual_machine_02" {
  depends_on              = [module.network_interface_02]
  source                  = "../../modules/azurerm_linux_virtual_machine"
  linux_vm_name           = var.linux_vm_name_02
  resource_group_name     = var.resource_group_name
  location                = var.location
  linux_vm_size           = var.linux_vm_size
  linux_vm_admin_username = var.linux_vm_02_admin_username
  linux_vm_admin_password = var.linux_vm_02_admin_password
  nic_name                = var.nic_name_02
  publisher               = var.publisher
  offer                   = var.offer
  sku                     = var.sku
  image_version           = var.image_version
}

module "lb_public_ip" {
  depends_on          = [module.resource_group]
  source              = "../../modules/azurerm_public_ip"
  pip_name            = var.lb_pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "load_balancer" {
  depends_on           = [module.lb_public_ip]
  source               = "../../modules/azurerm_load_balancer"
  lb_name              = var.lb_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  pip_name             = var.lb_pip_name
  lb_backend_pool_name = var.lb_backend_pool_name
  lb_rule              = var.lb_rule
  lb_probe_name        = var.lb_probe_name
}

module "linux_virtual_machine_01_lb_association" {
  source                = "../../modules/azurerm_nic_lb_association"
  nic_name              = var.nic_name_01
  resource_group_name   = var.resource_group_name
  lb_name               = var.lb_name
  lb_backend_pool_name  = var.lb_backend_pool_name
  ip_configuration_name = var.ip_configuration_name
}

module "linux_virtual_machine_02_lb_association" {
  source                = "../../modules/azurerm_nic_lb_association"
  nic_name              = var.nic_name_02
  resource_group_name   = var.resource_group_name
  lb_name               = var.lb_name
  lb_backend_pool_name  = var.lb_backend_pool_name
  ip_configuration_name = var.ip_configuration_name
}
