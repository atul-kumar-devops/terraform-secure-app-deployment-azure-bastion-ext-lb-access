resource "azurerm_network_interface_address_pool_association" "child_nic_association" {
  network_interface_id            = data.azurerm_network_interface.id
  ip_configuration_name           = var.ip_configuration_name
  azurerm_lb_backend_address_pool = azurerm_lb_backend_address_pool.child_lb_backend_pool.id
}