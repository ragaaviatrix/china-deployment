variable "azure_transit_regions" {
  type = map(object({
    primary_gw = object({
      name                = string
      resource_group_name = string
      location            = string
    })
    ha_gw = object({
      name                = string
      resource_group_name = string
      location            = string
    })
  }))
}

variable "aws_transit_regions" {
  type = map(object({
    primary_gw = object({
      region = string
      tags   = map(string)
    })
    ha_gw = object({
      region = string
      tags   = map(string)
    })
  }))
}

variable "azure_spoke_regions_sub1" {
  type = map(map(object({
    name                = string
    resource_group_name = string
    location            = string
    subscription_id     = string
  })))
}

variable "azure_spoke_regions_sub2" {
  type = map(map(object({
    name                = string
    resource_group_name = string
    location            = string
    subscription_id     = string
  })))

}

variable "client_secret" {
  type        = string
  description = "Client Secret for Azure Service Principal."
  sensitive   = true

}

variable "aws_spoke_regions_acc1" {
  type = map(map(object({
    region = string
    tags   = map(string)
  })))
}

variable "aws_spoke_regions_acc2" {
  type = map(map(object({
    region = string
    tags   = map(string)
  })))
}

variable "controller_nsg_name" {
  type        = string
  description = "Name of the Network Security Group for the controller."
}

variable "controller_resource_group_name" {
  type        = string
  description = "Resource Group Name for the controller."
}

variable "copilot_nsg_name" {
  type        = string
  description = "Name of the Network Security Group for the CoPilot."
}

