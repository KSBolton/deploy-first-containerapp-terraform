# resource "azurerm_resource_group" "rg" {
#   name     = "${var.app_name}-rg"
#   location = var.location
#   tags = {
#     Environment = var.environment
#   }
# }

data "azurerm_resource_group" "rg" {
  name = "deploy-first-containerapp-rg"
}

module "loganalytics" {
  source                       = "./modules/log-analytics"
  log_analytics_workspace_name = "${var.app_name}la"
  location                     = var.location
  log_analytics_workspace_sku  = "PerGB2018"
  environment                  = var.environment
  resource_group_name          = data.azurerm_resource_group.rg.name
}

module "acr" {
  source              = "./modules/acr"
  name                = "${var.acr_name}acr"
  location            = var.location
  environment         = var.environment
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "Basic"
}

module "appinsights" {
  source              = "./modules/appinsights"
  name                = "${var.app_name}insights"
  location            = var.location
  environment         = var.environment
  application_type    = "web"
  resource_group_name = data.azurerm_resource_group.rg.name
}
