resource "azurerm_public_ip" "PIA" {
  for_each = var.IP_name
  name                = each.value.IP_name
  resource_group_name = each.value.rg_name
  location            = each.value.IP_location
  allocation_method   = each.value.allocation_method
  sku                = each.value.sku
}