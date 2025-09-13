resource "azurerm_network_interface" "child_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_child_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "child_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.child_nic.id
  network_security_group_id = data.azurerm_network_security_group.data_child_nsg.id
}
