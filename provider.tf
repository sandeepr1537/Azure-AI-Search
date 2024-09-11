terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0" # Adjust to the version you need
    }
  }
}

provider "azurerm" {
  features {}
  version = "~> 3.0" # Adjust to the version you need
}
