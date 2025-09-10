resource "azurerm_bastion_host" "child_bastion" {
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "internal"
    subnet_id            = data.azurerm_subnet.child_subnet.id
    public_ip_address_id = data.azurerm_public_ip.name.id
  }
}
