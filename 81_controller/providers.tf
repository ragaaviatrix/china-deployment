terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.53.1"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.3"
    }
  }
}

provider "azurerm" {
  features {}
}

