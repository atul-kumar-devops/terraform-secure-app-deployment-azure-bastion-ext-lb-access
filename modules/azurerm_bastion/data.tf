data "azurerm_subnet" "child_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "name" {
  name = var.pip_name
  resource_group_name = var.resource_group_name
}
