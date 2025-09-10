resource "azurerm_network_interface" "child_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_child_subnet.id
    private_ip_address_allocation = "Static"
  }
}
