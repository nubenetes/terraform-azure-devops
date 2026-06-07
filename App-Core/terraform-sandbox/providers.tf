terraform {
  required_version = "~> 1.5.1"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.63.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.39.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
    # mongodbatlas = {
    #   source      = "mongodb/mongodbatlas"
    #   version     = "~> 1.8.1"
    # }
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = "~> 2.18.1"
    # }
  }
}

provider "azurerm" {
  features {}
}
