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
  features {}
}

provider "aviatrix" {

}

provider "aws" {
  
}
