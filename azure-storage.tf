resource "azurerm_storage_account" "azure-storage-containers" {
  name = "containers4344e8593505"
  resource_group_name = azurerm_resource_group.azure-rg-containers.name
  location = azurerm_resource_group.azure-rg-containers.location

  account_replication_type = "LRS"
  account_kind = "StorageV2"
  account_tier = "Standard"
}

