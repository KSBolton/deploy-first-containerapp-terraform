resource "azurerm_application_insights" "appinsights" {
  name                = "${var.name}-rg"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  workspace_id        = var.la_ws_id 
}