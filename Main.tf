resource "azurerm_resource_group" "rg" {
  for_each = var.resource_group
  name     = each.key
  location = each.value
}
resource "azurerm_storage_account" "storage" {
  for_each                 = var.storage_account
  name                     = each.value.stg_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.acc_replication
  depends_on = [ azurerm_resource_group.rg]
}

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.virtual_network
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_spaces
  depends_on = [azurerm_resource_group.rg]

}

