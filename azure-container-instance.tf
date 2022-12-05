resource "azurerm_container_group" "container-nginx" {
  resource_group_name = azurerm_resource_group.azure-rg-containers.name
  name = "aci-nginx"
  location = azurerm_resource_group.azure-rg-containers.location
  os_type = "Linux"

  container {
    name = "webserver"
    image = "docker.io/nginx:1.23"
    cpu = 0.2
    memory = 0.1
    ports {
      port = 80
      protocol = "TCP"
    }
  }
}