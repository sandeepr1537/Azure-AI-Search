provider "azurerm" {
  features {}
}

# Variables
variable "search_service_name" {
  default = "myprojsearchservice01"
  type    = string
}

variable "storage_account_name" {
  default = "myprojstorageaccount01"
  type    = string
}

variable "cognitive_services_name" {
  default = "myproazureaIservices01"
  type    = string
}

# Cognitive Services Account
resource "azurerm_cognitive_account" "myproj_cognitive_services" {
  name                = var.cognitive_services_name
  location            = "Australia East"
  resource_group_name = azurerm_resource_group.myproj_rg.name
  kind                = "CognitiveServices"
  sku_name            = "S0"
  identity {
    type = "None"
  }
  custom_subdomain_name = "myproazureaiservices01"
  public_network_access_enabled = true
}

# Azure Search Service
resource "azurerm_search_service" "myproj_search_service" {
  name                = var.search_service_name
  location            = "Australia East"
  resource_group_name = azurerm_resource_group.myproj_rg.name
  sku                 = "basic"
  replica_count       = 1
  partition_count     = 1
  public_network_access_enabled = true
  disable_local_auth  = false
  semantic_search     = "free"
}

# Storage Account
resource "azurerm_storage_account" "myproj_storage_account" {
  name                     = var.storage_account_name
  location                 = "Australia East"
  resource_group_name      = azurerm_resource_group.myproj_rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  kind                     = "StorageV2"
  enable_large_file_share   = true
  allow_blob_public_access  = true
  minimum_tls_version       = "TLS1_2"
  allow_shared_key_access   = true
  public_network_access_enabled = true

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  blob_properties {
    delete_retention_policy {
      days    = 7
      enabled = true
    }
    container_delete_retention_policy {
      days    = 7
      enabled = true
    }
  }

  file_properties {
    delete_retention_policy {
      days    = 7
      enabled = true
    }
  }
}

# Blob Container
resource "azurerm_storage_container" "myproj_blob_container" {
  name                  = "margies"
  storage_account_name  = azurerm_storage_account.myproj_storage_account.name
  container_access_type = "blob"
}

# Resource Group
resource "azurerm_resource_group" "myproj_rg" {
  name     = "myproj_resource_group"
  location = "Australia East"
}
