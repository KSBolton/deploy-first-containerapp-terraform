provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "deploy-first-containerapp-rg"
    storage_account_name = "deploy1stcontainersaksb"
    container_name       = "tfstate"
    key                  = "terraform-base.tfstate"
  }
}

data "azurerm_client_config" "current" {}