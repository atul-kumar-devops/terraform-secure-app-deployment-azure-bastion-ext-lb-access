

resource "azurerm_linux_virtual_machine" "child_linux_vm" {
  name                  = var.linux_vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.linux_vm_size
  admin_username        = ""
  network_interface_ids = [data.azurerm_network_interface.data_child_nic.id, ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )
}
