resource "azurerm_linux_virtual_machine" "VM" {
  for_each                        = var.vm_name
  name                            = each.value.vm_name
  location                        = each.value.vm_location
  resource_group_name             = each.value.rg_name
  size                            = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret.admin_login.value
  admin_password                  = data.azurerm_key_vault_secret.admin_password.value
  disable_password_authentication = each.value.disable_password

  network_interface_ids = [
    data.azurerm_network_interface.net_front[each.key].id
  ]
  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      name                 = os_disk.value.name
      disk_size_gb         = os_disk.value.disk_size_gb
      caching              = os_disk.value.os_caching
      storage_account_type = os_disk.value.storage_account_type
    }

  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.image_publisher
      offer     = source_image_reference.value.image_offer
      sku       = source_image_reference.value.image_sku
      version   = source_image_reference.value.image_version
    }
  }
}
