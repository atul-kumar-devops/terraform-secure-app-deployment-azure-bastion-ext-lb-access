data "azurerm_subnet" "data_child_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "data_child_nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}
