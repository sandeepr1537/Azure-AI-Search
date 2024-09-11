variable "resource_group" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "storage_account" {
  description = "The name of the Storage Account"
  type        = string
}

variable "storage_container" {
  description = "The name of the storage container"
  type        = string
}

variable "search_service" {
  description = "The name of the Azure Search Service"
  type        = string
}

variable "cognitive_account" {
  description = "The name of the Azure cognitive account"
  type        = string
}

variable "sku" {
  description = "The SKU name of the Azure Cognitive Services account"
  type        = string
}

variable "client_id" {
  description = "The client ID for Azure authentication"
  type        = string
}

variable "client_secret" {
  description = "The client secret for Azure authentication"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for Azure authentication"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID for Azure authentication"
  type        = string
}

