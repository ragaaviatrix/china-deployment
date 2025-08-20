terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.3.0"
    }
    aviatrix = {
      source  = "aviatrixsystems/aviatrix"
      version = "~>3.2.0"
    }
  }
}

provider "azurerm" {
  alias           = "spokesub1"
  subscription_id = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
  features {}
}

provider "azurerm" {
  alias           = "spokesub2"
  subscription_id = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
  features {}
}

provider "azurerm" {
  features {}
}

provider "aviatrix" {

}

provider "aws" {

}
