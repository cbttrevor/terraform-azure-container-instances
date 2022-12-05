resource "azurerm_container_group" "azure-aci-mysql" {
  depends_on = [
    azurerm_storage_share.azure-share-containers,
    azurerm_storage_account.azure-storage-containers
  ]
  resource_group_name = azurerm_resource_group.azure-rg-containers.name
  location = azurerm_resource_group.azure-rg-containers.location
  name = "aci-mysql"
  os_type = "Linux"

  container {
    name = "cbtdatabase"
    image = "docker.io/mysql:8.0.31"
    cpu = 0.5
    memory = 0.4
    environment_variables = {
      MYSQL_ROOT_PASSWORD = "CBTnuggets789!"
    }
    ports {
      port = 3306
      protocol = "TCP"
    }
    ports {
      port = 33060
      protocol = "TCP"
    }
    volume {
      name = "mysqldata"
      mount_path = "/var/lib/mysql"
      storage_account_name = azurerm_storage_account.azure-storage-containers.name
      share_name = azurerm_storage_share.azure-share-containers.name
      storage_account_key = azurerm_storage_account.azure-storage-containers.primary_access_key
    }
  }
}