terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
}

provider "azurerm" {
  client_id = "------------------------------"
  tenant_id = "------------------------------"
  subscription_id = "------------------------------"
  client_secret = "------------------------------"
  features {
  }
}