data "azurerm_public_ip" "data_public_ip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}
