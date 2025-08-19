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
    })
    ha_gw = object({
      region = string
    })
  }))
}

variable "azure_spoke_regions" {
  type = map(map(object({
    name                = string
    resource_group_name = string
    location            = string
  })))
}

variable "aws_spoke_regions" {
  type = map(map(object({
    region = string
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
