resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account
  resource_group_name       = azurerm_resource_group.resource_group.name
  location                  = azurerm_resource_group.resource_group.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  allow_blob_public_access  = "true" # This allows anonymous access on individual containers

  tags = {
    environment = "staging"
  }
}

resource "azurerm_search_service" "search_service" {
  name                = var.search_service
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "basic"
}

resource "azurerm_cognitive_account" "cognitive_account" {
  name                = var.cognitive_account
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku_name            = var.sku
  kind                = "CognitiveServices"
}
