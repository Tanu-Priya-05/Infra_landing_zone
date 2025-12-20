data "azurerm_mssql_server" "sql_s_id" {
  name                = "sql-server-tanu"
  resource_group_name = "rg_prod_tanu"
}