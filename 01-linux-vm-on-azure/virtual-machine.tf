resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                  = "${local.resource_name_prefix}-linuxvm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_D2s_v3"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.linuxvm_nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/cloud_id_ed25519.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}
