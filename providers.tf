terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.3.0"
    }
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "8.1.1"
    }
  }
}

provider "azurerm" {
  alias           = "spokesub1"
  subscription_id = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
  client_id       = "5a282081-4748-40a8-b5a9-e8c60b2bb88a"
  client_secret   = var.client_secret
  tenant_id       = "e600d6cb-71a8-4438-b9c7-fd6bc197f582"
  features {}
}

provider "azurerm" {
  alias           = "spokesub2"
  subscription_id = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
  client_id       = "5a282081-4748-40a8-b5a9-e8c60b2bb88a"
  client_secret   = var.client_secret
  tenant_id       = "e600d6cb-71a8-4438-b9c7-fd6bc197f582"
  features {}
}

provider "azurerm" {
  alias           = "controllersub"
  subscription_id = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
  client_id       = "5a282081-4748-40a8-b5a9-e8c60b2bb88a"
  client_secret   = var.client_secret
  tenant_id       = "e600d6cb-71a8-4438-b9c7-fd6bc197f582"
  features {}

}

provider "azurerm" {
  features {}
}


provider "aviatrix" {

}

provider "aws" {
  alias   = "aws_cnn1"
  region  = "cn-north-1"
  profile = "aws_cnn1"

}

provider "aws" {
  alias   = "aws_cnnw1"
  region  = "cn-northwest-1"
  profile = "aws_cnnw1"

}

