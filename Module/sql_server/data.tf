data "azurerm_key_vault" "kvis" {
  name                = "tanuvault"
  resource_group_name = "rg_Tanu"
}

data "azurerm_key_vault_secret" "sql_admin_login" {
  name         = "sql-admin-login"
  key_vault_id = data.azurerm_key_vault.kvis.id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
    name        = "sql-admin-password"
    key_vault_id = data.azurerm_key_vault.kvis.id
}