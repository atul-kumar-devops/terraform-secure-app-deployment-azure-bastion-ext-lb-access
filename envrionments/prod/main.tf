module "resource_group" {
  source              = "../../modules/azurerm_resource_group"
  resource_group_name = ""
  location            = "centralus"
}
