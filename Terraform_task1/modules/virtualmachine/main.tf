# Jumphost VM1
resource "azurerm_network_interface" "ani" {
  name                = "nic-${var.region}-${var.env}" #"vm1_nic01"
  location            = var.azure_region
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "vm1_ip01"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "virtual_machine" {
  name                  = "vm-${var.region}-${var.env}" #"commonplatstg-git-vm01" # Github runner VM
  location              = var.azure_region
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.ani.id]
  vm_size               = var.vm_family #"Standard_B4ms"
  boot_diagnostics {
    enabled     = true
    storage_uri = ""
  }

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.7"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk-${var.region}-${var.env}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }

  os_profile {
    computer_name  = var.vm_computer_name #"commonplatvm01" # VM only 15 characters allowed
    admin_username = var.vm_user          #"jumpadmin"
    admin_password = var.vm_password      #"Password@1234"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "Common Platform"
    Purpose     = "Github Runner VM"
  }


}

resource "azurerm_managed_disk" "managed_disk" {
  name                 = "disk-${var.region}-${var.env}"
  location             = var.azure_region
  resource_group_name  = var.rg_name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 256
}

resource "azurerm_virtual_machine_data_disk_attachment" "machine_data_disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.managed_disk.id
  virtual_machine_id = azurerm_virtual_machine.virtual_machine.id
  lun                = "10"
  caching            = "ReadWrite"
}

