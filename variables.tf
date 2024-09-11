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

variable "cognitive_account" {
  description = "The name of the Azure Search Service"
  type        = string
}


variable "sku" {
  type        = string
  description = "The sku name of the Azure Analysis Services server to create. Choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9. Some skus are region specific. See https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-overview#availability-by-region"
 
}


