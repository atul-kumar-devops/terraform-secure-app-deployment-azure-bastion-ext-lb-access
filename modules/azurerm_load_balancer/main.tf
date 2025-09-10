resource "azurerm_lb" "child_lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "NetflixPublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.data_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "child_lb_backend_pool" {
  name            = var.lb_backend_pool_name
  loadbalancer_id = azurerm_lb.child_lb.id
}


resource "azurerm_lb_rule" "child_lb_rule" {
  loadbalancer_id                = azurerm_lb.child_lb.id
  name                           = var.lb_rule
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "internal"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.child_lb_backend_pool.id, ]
  probe_id                       = azurerm_lb_probe.child_lb_probe.id
}

resource "azurerm_lb_probe" "child_lb_probe" {
  loadbalancer_id = azurerm_lb.child_lb.id
  name            = var.lb_probe_name
  port            = 80
}

