# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.96.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  client_id         = var.client_id
  client_secret     = var.client_secret
}

#Creating a Resouce Group
resource "azurerm_resource_group" "example" {
  name     = "IAC_Group"
  location = var.location
}

#Creating a Static Web App
resource "azurerm_static_web_app" "web_app" {
  name                = "GuessMyNumberApp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}