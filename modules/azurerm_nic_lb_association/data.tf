data "azurerm_network_interface" "data_child_nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_lb" "data_child_lb"{
    name = var.lb_name
    resource_group_name = var.resource_group_name
}

data "azurerm_lb_backend_address_pool" "data_child_lb_backend_address_pool" {
  name = var.lb_backend_pool_name
  loadbalancer_id = data.azurerm_lb.data_child_lb.id
}