resource "azurerm_network_interface_backend_address_pool_association" "child_nic_backendpool_association" {
  network_interface_id    = data.azurerm_network_interface.data_child_nic.id
  ip_configuration_name   = var.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.data_child_lb_backend_address_pool.id
}
