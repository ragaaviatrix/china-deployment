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
  alias      = "aws_apse1"
  region     = "ap-southeast-1"
  access_key = var.aws_apse1_access_key
  secret_key = var.aws_apse1_secret_key
}

provider "aws" {
  alias      = "aws_use1"
  region     = "us-east-1"
  access_key = var.aws_use1_access_key
  secret_key = var.aws_use1_secret_key
}
