data "azurerm_key_vault" "kvis" {
  name                = "tanu-key-vault"
  resource_group_name = "rg_Tanu"
}

data "azurerm_key_vault_secret" "sql_admin_login" {
  name         = "server-username"
  key_vault_id = data.azurerm_key_vault.kvis.id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
    name        = "server-password"
    key_vault_id = data.azurerm_key_vault.kvis.id
}