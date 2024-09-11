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

variable "search_service" {
  description = "The name of the Azure Search Service"
  type        = string
}
