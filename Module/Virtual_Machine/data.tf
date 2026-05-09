data "azurerm_network_interface" "net_front" {
  for_each = var.vm_name

  name                = each.value.network_interface_name
  resource_group_name = each.value.rg_name
}
data "azurerm_key_vault" "kvi" {
  name                = "tanuvault"
  resource_group_name = "rg_Tanu"
}

data "azurerm_key_vault_secret" "admin_login" {
  name         = "admin-login"
  key_vault_id = data.azurerm_key_vault.kvi.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.kvi.id
}