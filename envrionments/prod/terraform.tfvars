resource_group_name = "prod-rg-centralus-01"
location            = "centralus"

virtual_network_name = "prod-vnet-centralus"
address_space        = ["10.0.0.0/24"]

subnet_name_01      = "prod-subnet-web-centralus-01"
address_prefixes_01 = ["10.0.0.0/26"]

subnet_name_02      = "prod-subnet-app-centralus-01"
address_prefixes_02 = ["10.0.0.64/26"]

nsg_name_01 = "prod-nsg-web-centralus-01"

nsg_name_02 = "prod-nsg-app-centralus-01"

nic_name_01 = "prod-nic-web-centralus-01"

nic_name_02 = "prod-nic-app-centralus-01"

linux_vm_name_01 = "prod-vm-web-centralus-01"

linux_vm_name_02 = "prod-vm-app-centralus-01"

linux_vm_01_admin_username = "VM01"
linux_vm_01_admin_password = "Adminuser@123"

linux_vm_02_admin_username = "VM02"
linux_vm_02_admin_password = "Adminuser@123"

linux_vm_size = "Standard_B1s"
publisher     = "Canonical"
offer         = "0001-com-ubuntu-server-jammy"
sku           = "22_04-lts"
image_version = "latest"


lb_name              = "prod-lb-web-centralus-01"
lb_pip_name          = "prod-pip-lb-web-centralus-01"
lb_backend_pool_name = "prod-bepool-web-centralus-01"
lb_rule              = "prod-lbrule-http-centralus-01"
lb_probe_name        = "prod-probe-http-centralus-01"

ip_configuration_name = "internal"

bastion_pip_name = "prod-bastion-centralus-pip"

bastion_subnet_name             = "AzureBastionSubnet"
bastion_subnet_address_prefixes = ["10.0.0.128/26"]
bastion_host_name               = "prod-bastion-centralus"
