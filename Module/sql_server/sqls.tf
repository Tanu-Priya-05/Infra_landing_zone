resource "azurerm_mssql_server" "sql_s" {
  for_each = var.sql_server_name
  name                         = each.value.sql_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.sql_version
  administrator_login          = data.azurerm_key_vault_secret.sql_admin_login.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_admin_password.value

}

